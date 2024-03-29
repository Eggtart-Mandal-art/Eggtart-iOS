//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Junyoung on 3/19/24.
//

import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin


let project = Project.makeModule(
    name: "Core",
    targets: [.dynamicFramework],
    internalDependencies: [
        .Core.designKit,
        .Core.networkKit
    ]
)
