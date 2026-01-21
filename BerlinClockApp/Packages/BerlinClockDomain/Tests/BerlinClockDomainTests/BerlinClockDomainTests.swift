import XCTest
import ClockCore
@testable import BerlinClockDomain

final class BerlinClockDomainTests: XCTestCase {
    func test_even_seconds_turn_seconds_lamp_on() throws {
        let time = try Time(hours: 0, minutes: 0, seconds: 2)
        let sut = BerlinClockConverter()

        let state = try sut.convert(time)

        XCTAssertEqual(state.seconds, [.second])
    }

    func test_odd_seconds_turn_seconds_lamp_off() throws {
        let time = try Time(hours: 0, minutes: 0, seconds: 1)
        let sut = BerlinClockConverter()

        let state = try sut.convert(time)

        XCTAssertEqual(state.seconds, [.off])
    }
}
