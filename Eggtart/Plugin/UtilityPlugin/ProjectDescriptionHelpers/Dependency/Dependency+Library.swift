//
//  Dependency+Library.swift
//  UtilityPlugin
//
//  Created by Junyoung on 3/17/24.
//

import Foundation

import ProjectDescription

public extension TargetDependency {
    enum SPM {}
    enum Carthage {}
    enum XCFramework {}
}

public extension TargetDependency.SPM {
    static let Moya = TargetDependency.external(name: "Moya")
    static let Swinject = TargetDependency.external(name: "Swinject")
    static let TCA = TargetDependency.external(name: "ComposableArchitecture")
    static let TCACoordinators = TargetDependency.external(name: "TCACoordinators")
    static let LookinServer = TargetDependency.external(name: "LookinServer")
}

public extension TargetDependency.XCFramework {
    
}

public extension Package {
    
}

public extension TargetDependency.Carthage {
    
}
