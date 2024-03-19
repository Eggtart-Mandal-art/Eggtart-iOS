//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Junyoung on 3/19/24.
//

import ProjectDescription
import UtilityPlugin

let project = Project.makeModule(
    name: "ThirdPartyLib",
    targets: [.staticFramework],
    externalDependencies: [
        .SPM.Moya
    ]
)
