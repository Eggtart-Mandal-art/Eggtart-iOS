//
//  CoordinatorView.swift
//  RootFeature
//
//  Created by Junyoung on 3/23/24.
//  Copyright © 2024 TuistTemplate. All rights reserved.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

import MainFeature
import MandalartFeature

public struct CoordinatorView: View {
    let store: StoreOf<Coordinator>
    
    public init(store: StoreOf<Coordinator>) {
        self.store = store
    }
    
    public var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) { screen in
                CaseLet(
                    /Screen.State.main,
                    action: Screen.Action.main,
                    then: MainView.init
                )
                
                CaseLet(
                    /Screen.State.mandalart,
                    action: Screen.Action.mandalart,
                    then: MandalartView.init
                )
            }
        }
    }
}
