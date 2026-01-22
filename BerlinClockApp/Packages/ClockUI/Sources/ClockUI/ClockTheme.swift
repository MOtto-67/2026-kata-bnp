import SwiftUI
import ClockCore

public protocol ClockTheme: Sendable {
    func style(for kind: LampKind) -> LampStyle
}

public struct LampStyle: Sendable {
    public let color: Color

    public init(color: Color) {
        self.color = color
    }
}
