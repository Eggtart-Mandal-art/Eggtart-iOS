//
//  module.swift
//  ProjectDescriptionHelpers
//
//  Created by Junyoung on 3/18/24.
//

import ProjectDescription

// command line 입력
// ex) tuist scaffold module --name "모듈명"

let nameAttribute: Template.Attribute = .required("name")

let template = Template(
    description: "Make MicroFeature Module",
    attributes: [nameAttribute],
    items: [
        // MARK: - Project.swift
        .file(path: "Project/Features\(nameAttribute)/Project.swift",
              templatePath: "stencil/project.stencil"),
        
        // MARK: - Sources
        .file(path: "Projects/Features/\(nameAttribute)/Sources/empty.swift",
              templatePath: "stencil/emptyFile.stencil"),
        
        // MARK: - Example(Demo)
        .file(path: "Projects/Features/\(nameAttribute)/Demo/Sources/AppDelegate.swift",
              templatePath: "stencil/appDelegate.stencil"),
        .file(path: "Projects/Features/\(nameAttribute)/Demo/Sources/SceneDelegate.swift",
              templatePath: "stencil/sceneDelegate.stencil"),
        
        // MARK: - Interface
        .file(path: "Projects/Features/\(nameAttribute)/Interface/empty.swift",
              templatePath: "stencil/emptyFile.stencil")
    ]
)
