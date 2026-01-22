import ClockCore
import SwiftUI

public protocol ClockTheme: Sendable {
    func style(for kind: LampKind) -> LampStyle
}

public struct LampStyle: Sendable {
    public let onColor: Color
    public let offColor: Color
    public let strokeColor: Color
    public let glowOpacity: Double

    public init(
        onColor: Color,
        offColor: Color = Color.white.opacity(0.08),
        strokeColor: Color = Color.black.opacity(0.25),
        glowOpacity: Double = 0.35
    ) {
        self.onColor = onColor
        self.offColor = offColor
        self.strokeColor = strokeColor
        self.glowOpacity = glowOpacity
    }
}
