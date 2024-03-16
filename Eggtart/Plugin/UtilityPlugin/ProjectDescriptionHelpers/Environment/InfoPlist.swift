//
//  InfoPlist.swift
//  UtilityPlugin
//
//  Created by Junyoung on 3/14/24.
//

import Foundation
import ProjectDescription

public extension Project {
    static let infoPlist: [String: Plist.Value] = [
        "CFBundleShortVersionString": "1.0.0",
        "CFBundleDevelopmentRegion": "ko",
        "CFBundleVersion": "1",
        "CFBundleIdentifier": "com.egg.tart",
        "CFBundleDisplayName": "에그타르트",
        "UILaunchStoryboardName": "Launch Screen",
        "UIUserInterfaceStyle": "Light",
        "LSSupportsOpeningDocumentsInPlace": true,
        "ITSAppUsesNonExemptEncryption": false,
        "UIApplicationSceneManifest": [
            "UIApplicationSupportsMultipleScenes": false,
            "UISceneConfigurations": [
                "UIWindowSceneSessionRoleApplication": [
                    [
                        "UISceneConfigurationName": "Default Configuration",
                        "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                    ],
                ]
            ]
        ]
    ]
}
