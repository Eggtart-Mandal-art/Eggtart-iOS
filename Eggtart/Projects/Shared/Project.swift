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
    name: "Shared",
    targets: [.dynamicFramework],
    internalDependencies: [
        .thirdPartyLib
    ]
)
