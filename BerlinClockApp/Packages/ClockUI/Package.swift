// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "ClockUI",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "ClockUI", targets: ["ClockUI"]),
    ],
    dependencies: [
        .package(path: "../ClockCore"),
    ],
    targets: [
        .target(
            name: "ClockUI",
            dependencies: ["ClockCore"]
        ),
        .testTarget(
            name: "ClockUITests",
            dependencies: ["ClockUI"]
        ),
    ]
)
