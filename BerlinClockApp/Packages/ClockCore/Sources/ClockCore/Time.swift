public struct Time: Sendable, Equatable, Hashable {
    public let hours: Int
    public let minutes: Int
    public let seconds: Int

    public init(hours: Int, minutes: Int, seconds: Int) throws {
        guard (0 ... 23).contains(hours) else { throw TimeError.invalidHours(hours) }
        guard (0 ... 59).contains(minutes) else { throw TimeError.invalidMinutes(minutes) }
        guard (0 ... 59).contains(seconds) else { throw TimeError.invalidSeconds(seconds) }

        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
    }
}

public enum TimeError: Error, Sendable, Equatable {
    case invalidHours(Int)
    case invalidMinutes(Int)
    case invalidSeconds(Int)
}
