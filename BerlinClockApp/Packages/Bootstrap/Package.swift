// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "Bootstrap",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Bootstrap", targets: ["Bootstrap"]),
    ],
    dependencies: [
        .package(path: "../ClockCore"),
        .package(path: "../BerlinClockDomain"),
        .package(path: "../ClockUI"),
        .package(path: "../ClockTime"),
    ],
    targets: [
        .target(
            name: "Bootstrap",
            dependencies: [
                "ClockCore",
                "BerlinClockDomain",
                "ClockUI",
                "ClockTime",
            ]
        ),
        .testTarget(
            name: "BootstrapTests",
            dependencies: ["Bootstrap"]
        ),
    ]
)
