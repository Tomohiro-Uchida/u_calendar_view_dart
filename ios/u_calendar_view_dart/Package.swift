// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "u_calendar_view_dart",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "u-calendar-view-dart", targets: ["u_calendar_view_dart"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "u_calendar_view_dart",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ],
            path: "Sources/u_calendar_view_dart",
            resources: [
                .process("Assets")
            ],
            publicHeadersPath: "."
        )
    ]
)
