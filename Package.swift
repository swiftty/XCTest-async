// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XCTest+async",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "XCTestAsync",
            targets: ["XCTestAsync"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "XCTestAsync",
            dependencies: []),
        .testTarget(
            name: "XCTestAsyncTests",
            dependencies: ["XCTestAsync"]),
    ]
)
