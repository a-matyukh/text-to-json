// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "text-to-json",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "text-to-json",
            targets: ["text-to-json"]),
    ],
    dependencies: [
        .package(url: "https://github.com/guinmoon/llmfarm_core.swift.git", branch: "main")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "text-to-json",
            dependencies: [.product(name: "llmfarm_core", package: "llmfarm_core.swift")]
        ),
        .testTarget(
            name: "text-to-jsonTests",
            dependencies: ["text-to-json"]),
    ]
)
