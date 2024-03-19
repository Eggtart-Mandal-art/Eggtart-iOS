//
//  FeatureTarget.swift
//  Project+Templates
//
//  Created by Junyoung Lee on 2024/03/17.
//

import ProjectDescription
import UtilityPlugin

public extension Project {
    
    // Project에서 모듈을 생성하는 static 함수
    static func makeModule(
        name: String,
        targets: Set<FeatureTarget>,
        packages: [Package] = [],
        internalDependencies: [TargetDependency] = [],  // 모듈간 의존성
        externalDependencies: [TargetDependency] = [],  // 외부 라이브러리 의존성
        interfaceDependencies: [TargetDependency] = [], // Feature Interface 의존성
        dependencies: [TargetDependency] = [],
        hasResourse: Bool = false
    ) -> Project {
        var projectTargets: [Target] = []
        var configurationName: ConfigurationName = "DEV"
        let configuration = XCConfig.project
        let baseSettings: SettingsDictionary = .baseSettings
        
        // MARK: - AppModule
        if targets.contains(.app) {
            let setting = baseSettings.setAutomaticProvisioning()
            
            if name.contains("Prod") {
                configurationName = "PROD"
            } else if name.contains("Test") {
                configurationName = "QA"
            }
            
            projectTargets.append(.makeTarget(name: name,
                                              product: .app,
                                              hasResource: hasResourse,
                                              infoPlist: .extendingDefault(with: Project.infoPlist),
                                              script: [],
                                              dependencies: [
                                                internalDependencies,
                                                externalDependencies
                                              ].flatMap { $0 },
                                              settings: .settings(base: setting)
                                             )
            )
        }
        
        // MARK: - Demo Module
        if targets.contains(.demo) {
            let setting = baseSettings.setAutomaticProvisioning()
            
            // MicroFeature에서 DemoApp은 Feautre, Testing 파일을 의존하기 때문에 두 모듈을 의존하게 해줍니다
            let dependencies: [TargetDependency] = [
                .target(name: "\(name)"),
            ]
            
            projectTargets.append(.makeTarget(name: "\(name)Demo",
                                              product: .app,
                                              hasResource: hasResourse,
                                              infoPlist: .default,
                                              script: [],
                                              dependencies: dependencies,
                                              settings: .settings(base: setting,
                                                                  configurations: configuration)
                                             )
            )
        }
        
        // MARK: - Tests Module
        if targets.contains(.tests) {
            let setting = baseSettings.setAutomaticProvisioning()
            
            // MicroFeature에서 Tests은 Demo와 동일하게 Feautre, Testing 파일을 의존하기 때문에 두 모듈을 의존하게 해줍니다
            let dependencies: [TargetDependency] = [
                .target(name: "\(name)")
            ]
            
            projectTargets.append(.makeTarget(name: "\(name)Test",
                                              product: .unitTests,
                                              hasResource: hasResourse,
                                              infoPlist: .extendingDefault(with: Project.infoPlist),
                                              script: [],
                                              dependencies: dependencies,
                                              settings: .settings(base: setting,
                                                                  configurations: XCConfig.framework)
                                             )
            )
        }
        
        // MARK: - Interface Module
        if targets.contains(.interface) {
            let setting = baseSettings.setAutomaticProvisioning()
            
            // MicroFeature에서 Interface는 한 Feature의 최하위입니다.
            projectTargets.append(.makeTarget(name: "\(name)Interface",
                                              product: .framework,
                                              hasResource: hasResourse,
                                              infoPlist: .extendingDefault(with: Project.infoPlist),
                                              script: [],
                                              dependencies: interfaceDependencies,
                                              settings: .settings(base: setting,
                                                                  configurations: XCConfig.framework)
                                             )
            )
        }
        
        // MARK: - Framework Source
        if targets.contains(where: { $0.isFramework }) {
            let setting = baseSettings.setAutomaticProvisioning()
            
            let dependencies:[TargetDependency] = targets.contains(.interface)
            ? [.target(name: "\(name)Interface")]
            : []
            
            projectTargets.append(.makeTarget(name: name,
                                              product: .framework,
                                              hasResource: hasResourse,
                                              infoPlist: .default,
                                              script: [],
                                              dependencies: dependencies + internalDependencies + externalDependencies,
                                              settings: .settings(base: setting)
                                             )
            )
        }
        
        // MARK: - Return Project
        return Project(
            name: name,
            organizationName: AppEnvironment.workspaceName,
            packages: packages,
            settings: .settings(configurations: configuration),
            targets: projectTargets,
            schemes: [targets.contains(.demo)
                      ? Scheme.makeDemoScheme(configs: configurationName, name: name)
                      : Scheme.makeScheme(configs: configurationName, name: name)
                     ]

        )
    }
}
