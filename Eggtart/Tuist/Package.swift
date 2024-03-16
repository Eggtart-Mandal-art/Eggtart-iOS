// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "EggtartPackage",
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.3"))
    ]
)
