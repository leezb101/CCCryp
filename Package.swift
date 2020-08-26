// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CCCryp",
    products: [
        .library(
            name: "CCCryp",
            targets: ["CCCryp"]),
    ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "1.3.1")
    ],
    targets: [
        .target(
            name: "CCCryp",
            dependencies: ["CryptoSwift"]),
        .testTarget(
            name: "CCCrypTests",
            dependencies: ["CCCryp"]),
    ]
)
