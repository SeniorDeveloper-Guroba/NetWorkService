// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GDNetwork",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "GDNetwork",
            targets: ["GDNetwork"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ashleymills/Reachability.swift", branch: "master"),
    ],
    targets: [
        .target(
            name: "GDNetwork",
            dependencies: [
                .product(name: "Reachability", package: "Reachability.swift"),
               
            ]),
        .testTarget(
            name: "GDNetworkTests",
            dependencies: ["GDNetwork"]),
    ]
)
