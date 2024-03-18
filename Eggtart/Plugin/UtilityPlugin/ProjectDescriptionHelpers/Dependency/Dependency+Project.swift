//
//  Dependency+Project.swift
//  UtilityPlugin
//
//  Created by Junyoung on 3/14/24.
//

import ProjectDescription

public typealias Dep = TargetDependency

public extension Dep {
    struct Features {
        public struct Main {}
    }
    
    struct Modules {
        
    }
}

public extension Dep.Features {
    static func project(name: String, group: String) -> Dep { .project(target: "\(group)\(name)", path: .relativeToFeature("\(group)\(name)")) }
    
    static let rootFeature = TargetDependency.project(target: "RootFeature", path: .relativeToFeature("RootFeature"))
}

public extension Path {
    
    static func relativeToFeature(_ path: String) -> Self {
        return .relativeToRoot("Projects/Features/\(path)")
    }
    
    static func relativeToModules(_ path: String) -> Self {
        return .relativeToRoot("Projects/Modules/\(path)")
    }
    
    static var app: Self {
        return .relativeToRoot("Projects/AppModuls/")
    }
}

//MARK: Test
public extension Dep.Features.Main {
    static let group = "Main"
    
    static let Feature = Dep.Features.project(name: "Feature", group: group)
    static let Interface = Dep.project(target: "\(group)FeatureInterface", path: .relativeToFeature("\(group)Feature"))
}
