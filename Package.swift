// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "Lima",
    platforms: [
        .iOS(.v15)
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
