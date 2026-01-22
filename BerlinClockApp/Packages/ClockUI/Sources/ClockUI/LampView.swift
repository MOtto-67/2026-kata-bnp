import ClockCore
import SwiftUI

public enum LampShape: Sendable {
    case circle
    case capsule
}

public struct LampView: View {
    private let style: LampStyle
    private let kind: LampKind
    private let shape: LampShape
    private let size: CGSize

    public init(style: LampStyle, kind: LampKind, shape: LampShape, size: CGSize) {
        self.style = style
        self.kind = kind
        self.shape = shape
        self.size = size
    }

    public var body: some View {
        switch shape {
        case .circle:
            lamp(Circle())

        case .capsule:
            lamp(Capsule())
        }
    }

    private func lamp<S: Shape>(_ shape: S) -> some View {
        let isOn = (kind != .off)

        return shape
            .fill(isOn ? style.onColor : style.offColor)
            .overlay(
                shape.stroke(style.strokeColor, lineWidth: 1)
            )
            .shadow(
                color: style.onColor.opacity(isOn ? style.glowOpacity : 0),
                radius: isOn ? 8 : 0
            )
            .scaleEffect(isOn ? 1.0 : 0.98)
            .opacity(isOn ? 1.0 : 0.85)
            .frame(width: size.width, height: size.height)
            .animation(.easeInOut(duration: 0.18), value: isOn)
    }
}
