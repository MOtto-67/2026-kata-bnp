import ClockCore

public struct BerlinClockConverter: Sendable {
    public init() {}

    public func convert(_ time: Time) throws -> ClockState {
        try ClockState(
            seconds: secondsRow(from: time),
            fiveHours: fiveHoursRow(from: time),
            oneHours: oneHoursRow(from: time),
            fiveMinutes: fiveMinutesRow(from: time),
            oneMinutes: oneMinutesRow(from: time)
        )
    }
}

// MARK: - Rows

private extension BerlinClockConverter {
    func secondsRow(from time: Time) -> [LampKind] {
        [(time.seconds.isEven) ? .second : .off]
    }

    func fiveHoursRow(from time: Time) -> [LampKind] {
        LampRow(
            lampCount: 4,
            litCount: time.hours / 5,
            kindForIndex: { _ in .hour }
        ).make()
    }

    func oneHoursRow(from time: Time) -> [LampKind] {
        LampRow(
            lampCount: 4,
            litCount: time.hours % 5,
            kindForIndex: { _ in .hour }
        ).make()
    }

    func fiveMinutesRow(from time: Time) -> [LampKind] {
        LampRow(
            lampCount: 11,
            litCount: time.minutes / 5,
            kindForIndex: { index in
                ((index + 1) % 3 == 0) ? .quarterMarker : .minute
            }
        ).make()
    }

    func oneMinutesRow(from time: Time) -> [LampKind] {
        LampRow(
            lampCount: 4,
            litCount: time.minutes % 5,
            kindForIndex: { _ in .minute }
        ).make()
    }
}
