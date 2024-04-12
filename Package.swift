// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "text-to-json",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "text-to-json",
            targets: ["text-to-json"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "text-to-json"),
        .testTarget(
            name: "text-to-jsonTests",
            dependencies: ["text-to-json"]),
    ]
)
