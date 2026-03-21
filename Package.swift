// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SmartSUI",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "SmartSUI",
            targets: ["SmartSUI"]
        ),
    ],
    targets: [
        .target(
            name: "SmartSUI",
            dependencies: []
        ),

    ]
)
