// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "SimpleButton",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "SimpleButton", targets: ["SimpleButton"])
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "SimpleButton", dependencies: [], path: "SimpleButton/")
    ],
    swiftLanguageVersions: [.v5]
)
