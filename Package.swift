// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "hubkit-service-api",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "HubkitServiceApi",
            targets: ["HubkitServiceApi"]
        ),
    ],
    dependencies: [
        .package(name: "Offenbach", url: "https://github.com/MoveUpwards/Offenbach.git", from: "2.0.0"),
        .package(name: "RxSwift", url: "https://github.com/ReactiveX/RxSwift.git", from: "6.0.0"),
        .package(url: "https://github.com/MoveUpwards/hubkit-model-swift.git", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "HubkitServiceApi",
            dependencies: [
                .product(name: "HubkitModel", package: "hubkit-model-swift"),
                "Offenbach",
                "RxSwift"
            ],
            path: "Sources"
        ),
    ]
)
