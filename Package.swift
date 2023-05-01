// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RESTService",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "RESTService",
            targets: ["RESTService"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ashleymills/Reachability.swift", branch: "master"),
        .package(url: "https://github.com/SeniorDeveloper-Guroba/AlertService", branch: "master"),
    ],
    targets: [
        .target(
            name: "RESTService",
            dependencies: [
                .product(name: "Reachability", package: "Reachability.swift"),
                .product(name: "AlertService", package: "AlertService"),
               
            ]),
    ]
)
