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
    name: "MainFeature",
    targets: Set(FeatureTarget.microFeature),
    internalDependencies: [
        .Features.Mandalart.Interface,
        .Features.Calendar.Interface,
        .Features.Setting.Interface,
    ],
    interfaceDependencies: [
        .domain
    ]
)


