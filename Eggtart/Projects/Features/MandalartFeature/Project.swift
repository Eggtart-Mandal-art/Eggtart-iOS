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
    name: "MandalartFeature",
    targets: Set(FeatureTarget.microFeature),
    internalDependencies: [
        .Features.MandalartEditor.Interface
    ],
    interfaceDependencies: [
        .domain
    ]
)


