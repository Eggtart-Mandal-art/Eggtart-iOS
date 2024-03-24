//
//  App.swift
//  Eggtart-DEV
//
//  Created by Junyoung on 3/23/24.
//  Copyright © 2024 TuistTemplate. All rights reserved.
//

import SwiftUI
import RootFeature
import MainFeature

@main
struct EggtartApp: App {
    var body: some Scene {
        WindowGroup {
            RootCoordinatorView(store: .init(
                initialState: RootCoordinator.State(),
                reducer: {
                    RootCoordinator()
            }))
        }
    }
}
