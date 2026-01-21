import ClockCore

public struct BerlinClockConverter {
    public init() {}

    public func convert(_ time: Time) throws -> ClockState {
        let seconds: [LampKind] = [
            time.seconds % 2 == 0 ? .second : .off,
        ]

        let fiveHoursOn = time.hours / 5
        let oneHoursOn = time.hours % 5

        let fiveHours: [LampKind] = (0 ..< 4).map { $0 < fiveHoursOn ? .hour : .off }
        let oneHours: [LampKind] = (0 ..< 4).map { $0 < oneHoursOn ? .hour : .off }
        let fiveMinutesOn = time.minutes / 5
        let fiveMinutes: [LampKind] = (0 ..< 11).map { index in
            guard index < fiveMinutesOn else { return .off }
            return (index + 1) % 3 == 0 ? .quarterMarker : .minute
        }

        return try ClockState(
            seconds: seconds,
            fiveHours: fiveHours,
            oneHours: oneHours,
            fiveMinutes: fiveMinutes,
            oneMinutes: [.off, .off, .off, .off]
        )
    }
}
