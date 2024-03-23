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
            CoordinatorView(store: .init(
                initialState: Coordinator.State(
                    routes: [
                        .root(.main(.init()),
                              embedInNavigationView: true)
                    ]
                ),
                reducer: {
                    Coordinator()
            }))
        }
    }
}
