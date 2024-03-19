//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Junyoung on 3/13/24.
//

import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(name: "\(Environment.appName)-QA", 
                                 targets: [.app],
                                 internalDependencies: [
                                    .Features.rootFeature
                                 ])
