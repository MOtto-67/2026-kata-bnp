import ClockCore

public protocol TimeProviderPrococol: Sendable {
    func now() throws -> Time
}
