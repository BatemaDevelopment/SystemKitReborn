// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SystemKitReborn",
    products: [
        .library(name: "SystemKitReborn", targets: ["SystemKitReborn"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "SystemKitReborn", dependencies: [], path: "SystemKitReborn"),
        .testTarget(name: "SystemKitRebornTests", dependencies: ["SystemKitReborn"], path: "SystemKitRebornTests")
    ],
    swiftLanguageVersions: [.v5]
)
