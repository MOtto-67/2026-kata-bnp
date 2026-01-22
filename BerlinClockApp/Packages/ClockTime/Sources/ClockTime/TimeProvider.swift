import ClockCore

public struct TimeProvider<Provider: TimeProviderPrococol>: Sendable {
    private let provider: Provider

    public init(provider: Provider) {
        self.provider = provider
    }

    public func stream(intervalSeconds: UInt64 = 1) -> AsyncStream<Time> {
        AsyncStream { continuation in
            let task = Task {
                if let time = try? provider.now() {
                    continuation.yield(time)
                }

                while !Task.isCancelled {
                    try? await Task.sleep(nanoseconds: intervalSeconds * Constant.oneSecond)
                    guard !Task.isCancelled else { break }

                    if let time = try? provider.now() {
                        continuation.yield(time)
                    }
                }

                continuation.finish()
            }

            continuation.onTermination = { _ in task.cancel() }
        }
    }
}

private enum Constant {
    static let oneSecond: UInt64 = 1_000_000_000 // Nano second
}
