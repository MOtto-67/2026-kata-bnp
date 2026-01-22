import ClockCore
import SwiftUI

public struct BerlinTheme: ClockTheme {
    public init() {}

    public func style(for kind: LampKind) -> LampStyle {
        switch kind {
        case .off:
            return LampStyle(onColor: .clear)
        case .second:
            return LampStyle(onColor: .yellow)
        case .hour:
            return LampStyle(onColor: .red)
        case .minute:
            return LampStyle(onColor: .yellow)
        case .quarterMarker:
            return LampStyle(onColor: .red, glowOpacity: 0.5)
        }
    }
}
