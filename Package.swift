// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "HubkitApiService",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "HubkitApiService",
            targets: ["HubkitApiService"]
        ),
    ],
    dependencies: [
        .package(name: "Offenbach", url: "https://github.com/MoveUpwards/Offenbach.git", from: "2.0.0"),
        .package(name: "RxSwift", url: "https://github.com/ReactiveX/RxSwift.git", from: "6.0.0"),
        .package(name: "HubkitDataModel", url: "https://github.com/MoveUpwards/hubkit-datamodel-ios.git", from: "1.0.1")
    ],
    targets: [
        .target(
            name: "HubkitApiService",
            dependencies: ["Offenbach", "RxSwift", "HubkitDataModel"],
            path: "Sources"
        ),
    ]
)
