import SwiftUI
import ClockCore
import ClockUI
import ClockTime
import BerlinClockDomain

struct ContentView: View {
    private let provider = SystemTimeProvider()
    private let converter = BerlinClockConverter()
    private let theme = BerlinTheme()

    @State private var time: Time = (try? Time(hours: 0, minutes: 0, seconds: 0))!
    @State private var state: ClockState = {
        let timer = (try? Time(hours: 0, minutes: 0, seconds: 0))!
        let converter = BerlinClockConverter()
        return (try? converter.convert(timer))!
    }()

    var body: some View {
        VStack(spacing: 16) {
            Text(String(format: "%02d:%02d:%02d", time.hours, time.minutes, time.seconds))
                .monospacedDigit()
                .font(.headline)

            ClockView(state: state, theme: theme)
        }
        .padding()
        .task {
            let ticker = TimeProvider(provider: provider)
            for await t in ticker.stream() {
                time = t
                if let newState = try? converter.convert(t) {
                    state = newState
                }
            }
        }
    }
}

