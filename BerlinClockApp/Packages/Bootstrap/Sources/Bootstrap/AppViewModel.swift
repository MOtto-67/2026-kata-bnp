import BerlinClockDomain
import ClockCore
import ClockTime
import Observation

@MainActor
@Observable
public final class AppViewModel {
    public private(set) var time: Time
    public private(set) var state: ClockState

    private let converter: BerlinClockConverter
    private let ticker: TimeProvider<SystemTimeProvider>

    public init(
        initialTime: Time,
        initialState: ClockState,
        converter: BerlinClockConverter,
        ticker: TimeProvider<SystemTimeProvider>
    ) {
        time = initialTime
        state = initialState
        self.converter = converter
        self.ticker = ticker
    }

    public func run() async {
        for await t in ticker.stream() {
            time = t
            if let newState = try? converter.convert(t) {
                state = newState
            }
        }
    }
}
