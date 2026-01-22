import SwiftUI
import ClockCore

public struct ClockView<Theme: ClockTheme>: View {
    private let state: ClockState
    private let theme: Theme

    public init(state: ClockState, theme: Theme) {
        self.state = state
        self.theme = theme
    }

    public var body: some View {
        VStack(spacing: 12) {
            row(state.seconds, size: CGSize(width: 20, height: 20))
            row(state.fiveHours, size: CGSize(width: 40, height: 16))
            row(state.oneHours, size: CGSize(width: 40, height: 16))
            row(state.fiveMinutes, size: CGSize(width: 24, height: 12))
            row(state.oneMinutes, size: CGSize(width: 40, height: 16))
        }
    }

    private func row(_ lamps: [LampKind], size: CGSize) -> some View {
        HStack(spacing: 8) {
            ForEach(Array(lamps.enumerated()), id: \.offset) { _, kind in
                LampView(
                    style: theme.style(for: kind),
                    size: size
                )
            }
        }
    }
}
