// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "ClockTime",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "ClockTime", targets: ["ClockTime"]),
    ],
    dependencies: [
        .package(path: "../ClockCore"),
    ],
    targets: [
        .target(
            name: "ClockTime",
            dependencies: ["ClockCore"]
        ),
        .testTarget(
            name: "ClockTimeTests",
            dependencies: ["ClockTime"]
        ),
    ]
)
