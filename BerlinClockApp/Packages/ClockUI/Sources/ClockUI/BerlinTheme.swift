import SwiftUI
import ClockCore

public struct BerlinTheme: ClockTheme {
    public init() {}

    public func style(for kind: LampKind) -> LampStyle {
        switch kind {
        case .off:
            return LampStyle(color: .gray.opacity(0.2))
        case .second:
            return LampStyle(color: .yellow)
        case .hour:
            return LampStyle(color: .red)
        case .minute:
            return LampStyle(color: .yellow)
        case .quarterMarker:
            return LampStyle(color: .red)
        }
    }
}
