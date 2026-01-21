public struct ClockState: Sendable, Equatable, Hashable {
    public typealias Row = [LampKind]

    public let seconds: Row // count == 1
    public let fiveHours: Row // count == 4
    public let oneHours: Row // count == 4
    public let fiveMinutes: Row // count == 11
    public let oneMinutes: Row // count == 4

    public init(
        seconds: Row,
        fiveHours: Row,
        oneHours: Row,
        fiveMinutes: Row,
        oneMinutes: Row
    ) throws {
        guard seconds.count == 1 else {
            throw ClockStateError.invalidRowCount(expected: 1, got: seconds.count, row: .seconds)
        }
        guard fiveHours.count == 4 else {
            throw ClockStateError.invalidRowCount(expected: 4, got: fiveHours.count, row: .fiveHours)
        }
        guard oneHours.count == 4 else {
            throw ClockStateError.invalidRowCount(expected: 4, got: oneHours.count, row: .oneHours)
        }
        guard fiveMinutes.count == 11 else {
            throw ClockStateError.invalidRowCount(expected: 11, got: fiveMinutes.count, row: .fiveMinutes)
        }
        guard oneMinutes.count == 4 else {
            throw ClockStateError.invalidRowCount(expected: 4, got: oneMinutes.count, row: .oneMinutes)
        }

        self.seconds = seconds
        self.fiveHours = fiveHours
        self.oneHours = oneHours
        self.fiveMinutes = fiveMinutes
        self.oneMinutes = oneMinutes
    }
}

public enum ClockStateRow: String, Sendable, Equatable {
    case seconds, fiveHours, oneHours, fiveMinutes, oneMinutes
}

public enum ClockStateError: Error, Sendable, Equatable {
    case invalidRowCount(expected: Int, got: Int, row: ClockStateRow)
}
