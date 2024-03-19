//
//  Path+Extension.swift
//  UtilityPlugin
//
//  Created by Junyoung on 3/19/24.
//

import ProjectDescription

public extension Path {
    
    static func relativeToFeature(_ path: String) -> Self {
        return .relativeToRoot("Projects/Features/\(path)")
    }
    
    static var app: Self {
        return .relativeToRoot("Projects/AppModuls/")
    }
    
    static var core: Self {
        return .relativeToRoot("Projects/Core/")
    }
    
    static var domain: Self {
        return .relativeToRoot("Projects/Domain")
    }
    
    static var shared: Self {
        return .relativeToRoot("Projects/Shared/")
    }
    
    static var thirdPartyLib: Self {
        return .relativeToRoot("Projects/ThirdPartyLib/")
    }
    
    static var designKit: Self {
        return .relativeToRoot("Projects/Core/DesignKit")
    }
    
    static var networkKit: Self {
        return .relativeToRoot("Projects/Core/NetworkKit")
    }
    
}
