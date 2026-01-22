import BerlinClockDomain
import ClockCore
import ClockTime
import ClockUI
import Observation

@Observable
public final class Bootstrap {
    public let theme: BerlinTheme
    public let viewModel: AppViewModel

    public init(theme: BerlinTheme, viewModel: AppViewModel) {
        self.theme = theme
        self.viewModel = viewModel
    }

    @MainActor public static func makeDefault() -> Bootstrap {
        let theme = BerlinTheme()

        let provider = SystemTimeProvider()
        let ticker = TimeProvider(provider: provider)
        let converter = BerlinClockConverter()

        // Valeurs initiales safe (00:00:00)
        let initialTime = (try? Time(hours: 0, minutes: 0, seconds: 0))!
        let initialState = (try? converter.convert(initialTime))!

        let vm = AppViewModel(
            initialTime: initialTime,
            initialState: initialState,
            converter: converter,
            ticker: ticker
        )

        return Bootstrap(theme: theme, viewModel: vm)
    }
}
