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
    targets: [.dynamicFramework],
    internalDependencies: [
        .Features.Splash.Feature,
        .Features.Main.Feature,
        .Features.Mandalart.Feature,
        .Features.MandalartEditor.Feature,
        .Features.Calendar.Feature,
        .Features.Setting.Feature,
    ]
)
