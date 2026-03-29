// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "gitsync-access-openapi-generator",
    platforms: [.macOS(.v13)],
    dependencies: [
        .package(url: "https://github.com/apple/swift-openapi-generator", from: Version(1,0,0)),
    ],
    targets: [
        .executableTarget(
            name: "GitSyncAccessOpenAPIGenerator",
            dependencies: [
                .product(name: "swift-openapi-generator", package: "swift-openapi-generator"),
            ]
        ),
    ]
)
