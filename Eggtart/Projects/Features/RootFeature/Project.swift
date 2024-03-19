//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Junyoung on 3/13/24.
//

import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "RootFeature",
    targets: Set(FeatureTarget.microFeature),
    internalDependencies: [.Features.Main.Feature]
)
