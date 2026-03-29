// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "gitsync-access-api",
    platforms: [.macOS(.v13), .iOS(.v16), .watchOS(.v9), .tvOS(.v16)],
    products: [
        .library(name: "GitSyncAccess", targets: ["GitSyncAccess"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-openapi-runtime", from: Version(1,8,0)),
        .package(url: "https://github.com/apple/swift-openapi-urlsession", from: Version(1,2,0))
    ],
    targets: [
        .target(
            name: "GitSyncAccess",
            dependencies: [
                .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
                .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession")
            ]
        ),
        .testTarget(
            name: "GitSyncAccessTests",
            dependencies: ["GitSyncAccess"]
        ),
    ]
)
