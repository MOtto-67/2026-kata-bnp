import ClockCore
import Foundation

public struct SystemTimeProvider: TimeProviderPrococol, Sendable {
    private let calendar: Calendar

    public init(calendar: Calendar = .current) {
        self.calendar = calendar
    }

    /// Implement now function
    public func now() throws -> Time {
        let date = Date()
        let comps = calendar.dateComponents([.hour, .minute, .second], from: date)

        guard
            let hour = comps.hour,
            let mminute = comps.minute,
            let second = comps.second
        else {
            throw SystemTimeError.invalidDateComponents
        }

        return try Time(hours: hour, minutes: mminute, seconds: second)
    }
}

public enum SystemTimeError: Error, Sendable, Equatable {
    case invalidDateComponents
}
