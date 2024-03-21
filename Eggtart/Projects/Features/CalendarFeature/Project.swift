//
//  project.swift
//  ProjectDescriptionHelpers
//
//  Created by Junyoung
//

import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "CalendarFeature",
    targets: Set(FeatureTarget.microFeature),
    interfaceDependencies: [
        .domain
    ]
)


