//
//  Config.swift
//  ProjectDescriptionHelpers
//
//  Created by Junyoung Lee on 2024/03/17.
//

import ProjectDescription

let config = Config(
    plugins: [
        .local(path: .relativeToRoot("Plugin/UtilityPlugin"))
    ]
)
