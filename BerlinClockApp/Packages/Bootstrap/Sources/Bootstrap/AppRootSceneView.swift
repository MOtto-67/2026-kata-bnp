import ClockUI
import SwiftUI

public struct AppRootSceneView: View {
    @Environment(Bootstrap.self) private var bootstrap

    public init() {}

    public var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color.white,
                    Color.purple.opacity(0.35),
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 16) {
                Text(
                    String(
                        format: "%02d:%02d:%02d",
                        bootstrap.viewModel.time.hours,
                        bootstrap.viewModel.time.minutes,
                        bootstrap.viewModel.time.seconds
                    )
                )
                .monospacedDigit()
                .font(.headline)

                ClockView(
                    state: bootstrap.viewModel.state,
                    theme: bootstrap.theme
                )
            }
        }
        .task {
            await bootstrap.viewModel.run()
        }
    }
}
