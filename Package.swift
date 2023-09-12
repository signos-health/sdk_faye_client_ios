// swift-tools-version:5.8
import PackageDescription
let package = Package(
    name: "ZendeskSDKFayeClient",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "ZendeskSDKFayeClient",
            targets: [
                "ZendeskSDKFayeClientTargets"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/zendesk/sdk_socket_client_ios",
                 from: "1.5.0"),
        .package(url: "https://github.com/zendesk/sdk_logger_ios",
                 from: "0.8.0")
    ],
    targets: [
        .binaryTarget(
            name: "ZendeskSDKFayeClient",
            path: "ZendeskSDKFayeClient.xcframework"
        ),
        .target(name: "ZendeskSDKFayeClientTargets",
                dependencies: [
                    .target(name: "ZendeskSDKFayeClient"),
                    .product(name: "ZendeskSDKSocketClient", package: "sdk_socket_client_ios"),
                    .product(name: "ZendeskSDKLogger", package: "sdk_logger_ios")
                ],
                path: "Sources")
    ]
)
