import Bootstrap
import SwiftUI

@main
struct BerlinClockApp: App {
    let bootstrap = Bootstrap.makeDefault()

    var body: some Scene {
        WindowGroup {
            AppRootSceneView()
                .environment(bootstrap)
        }
    }
}
