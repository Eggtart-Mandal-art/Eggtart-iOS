// swift-tools-version:5.9
import PackageDescription

#if TUIST
    import ProjectDescription
    import ProjectDescriptionHelpers
    import UtilityPlugin


    let packageSettings = PackageSettings(
        productTypes: [
            "Moya": .framework, // default is .staticFramework
        ], baseSettings: Settings.settings(configurations: XCConfig.framework)
        
    )
#endif

let package = Package(
    name: "EggtartPackage",
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.3"))
    ]
)
