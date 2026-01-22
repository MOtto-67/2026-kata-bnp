import ClockCore
import SwiftUI

public struct ClockView<T: ClockTheme>: View {
    private let state: ClockState
    private let theme: T

    public init(state: ClockState, theme: T) {
        self.state = state
        self.theme = theme
    }

    public var body: some View {
        VStack(spacing: 14) {
            row(state.seconds, shape: .circle, size: CGSize(width: 22, height: 22), spacing: 10)
            row(state.fiveHours, shape: .capsule, size: CGSize(width: 44, height: 18), spacing: 10)
            row(state.oneHours, shape: .capsule, size: CGSize(width: 44, height: 18), spacing: 10)
            row(state.fiveMinutes, shape: .capsule, size: CGSize(width: 26, height: 14), spacing: 6)
            row(state.oneMinutes, shape: .capsule, size: CGSize(width: 44, height: 18), spacing: 10)
        }
        .padding()
    }

    @ViewBuilder
    private func row(
        _ lamps: [LampKind],
        shape: LampShape,
        size: CGSize,
        spacing: CGFloat
    ) -> some View {
        HStack(spacing: spacing) {
            ForEach(Array(lamps.enumerated()), id: \.offset) { _, kind in
                LampView(
                    style: theme.style(for: kind),
                    kind: kind,
                    shape: shape,
                    size: size
                )
            }
        }
    }
}
