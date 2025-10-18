// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "swift-money",
    platforms: [
        .iOS(.v15),
        .macOS(.v15),
        .macCatalyst(.v15),
        .tvOS(.v15),
        .watchOS(.v8),
        .visionOS(.v1),
    ],
    products: [
        .library(name: "Money", targets: ["Money"]),
    ],
    targets: [
        .target(name: "Money"),
        .testTarget(name: "MoneyTests", dependencies: ["Money"]),
    ]
)

for target in package.targets where target.type != .system {
    target.swiftSettings = target.swiftSettings ?? []
    target.swiftSettings?.append(contentsOf: [
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
    ])
}
