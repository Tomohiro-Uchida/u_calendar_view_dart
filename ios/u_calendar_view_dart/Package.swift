// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "u_calendar_view_dart",
    platforms: [
        .iOS("13.0")
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
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ]
        )
    ]
)
