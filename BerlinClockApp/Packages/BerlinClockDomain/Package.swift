// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "BerlinClockDomain",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "BerlinClockDomain",
            targets: ["BerlinClockDomain"]
        ),
    ],
    dependencies: [
        .package(path: "../ClockCore"),
    ],
    targets: [
        .target(
            name: "BerlinClockDomain",
            dependencies: ["ClockCore"]
        ),
        .testTarget(
            name: "BerlinClockDomainTests",
            dependencies: ["BerlinClockDomain"]
        ),
    ]
)
