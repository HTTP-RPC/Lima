// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Lima",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "Lima",
            targets: ["Lima"])
    ],
    targets: [
        .target(
            name: "Lima",
            dependencies: ["LimaObjC"]),
        .target(
            name: "LimaObjC",
            path: "Sources/LimaObjC")
    ]
)
