// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Lima",
    platforms: [
        .iOS(.v16)
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
