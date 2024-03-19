//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Junyoung on 3/19/24.
//

import ProjectDescriptionHelpers
import ProjectDescription
import UtilityPlugin

let project = Project.makeModule(
    name: "ThirdPartyLib",
    targets: [.dynamicFramework],
    externalDependencies: [
        .SPM.Moya,
        .SPM.TCA,
        .SPM.TCACoordinators
    ]
)
