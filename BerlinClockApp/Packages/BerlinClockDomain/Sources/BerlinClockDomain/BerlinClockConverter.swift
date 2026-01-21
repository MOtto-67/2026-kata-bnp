import ClockCore

public struct BerlinClockConverter {
    public init() {}

    public func convert(_ time: Time) throws -> ClockState {
        let seconds: [LampKind] = [
            time.seconds % 2 == 0 ? .second : .off
        ]

        return try ClockState(
            seconds: seconds,
            fiveHours: [.off, .off, .off, .off],
            oneHours: [.off, .off, .off, .off],
            fiveMinutes: Array(repeating: .off, count: 11),
            oneMinutes: [.off, .off, .off, .off]
        )
    }
}
