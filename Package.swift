// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "gitsync-access-api",
    products: [
        .library(name: "GitSyncAccess", targets: ["GitSyncAccess"]),
    ],
    targets: [
        .target(
            name: "GitSyncAccess"
        ),
        .testTarget(
            name: "GitSyncAccessTests",
            dependencies: ["GitSyncAccess"]
        ),
    ]
)
