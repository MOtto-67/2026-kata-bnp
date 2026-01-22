import SwiftUI
import ClockCore

public struct LampView: View {
    private let style: LampStyle
    private let size: CGSize

    public init(style: LampStyle, size: CGSize) {
        self.style = style
        self.size = size
    }

    public var body: some View {
        Circle()
            .fill(style.color)
            .frame(width: size.width, height: size.height)
    }
}
