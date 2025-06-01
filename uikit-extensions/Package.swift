// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "uikit-extensions",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "uikit-extensions",
            targets: ["uikit-extensions"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Incetro/layout.git", branch: "main")
    ],
    targets: [
        .target(
            name: "uikit-extensions",
            dependencies: [
                .product(
                    name: "Layout",
                    package: "layout"
                )
            ]
        ),
        .testTarget(
            name: "uikit-extensionsTests",
            dependencies: ["uikit-extensions"]
        ),
    ]
)
