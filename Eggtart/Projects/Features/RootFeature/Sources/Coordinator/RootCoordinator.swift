//
//  Coordinator.swift
//  RootFeature
//
//  Created by Junyoung on 3/23/24.
//  Copyright © 2024 TuistTemplate. All rights reserved.
//

import ComposableArchitecture
import TCACoordinators
import SwiftUI

import MainFeature
import MainFeatureInterface
import MandalartFeature
import MandalartEditorFeature
import Shared

// MARK: - Coordinator
public struct RootCoordinator: Reducer {
    public struct State: Equatable, IndexedRouterState {
        public var routes: [Route<RootScreen.State>] = [
            .root(.main(.init()),
                  embedInNavigationView: true)
        ]
        
        public init() {}
    }
    
    public enum Action: IndexedRouterAction {
        case routeAction(Int, action: RootScreen.Action)
        case updateRoutes([Route<RootScreen.State>])
        case selectTab(TabBarType)
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .routeAction(_, action: .main):
                return .none
            case .updateRoutes(_):
                return .none
            default:
                break
            }
            return .none
        }.forEachRoute {
            RootScreen()
        }
    }
}

// MARK: - CoordinatorView
public struct RootCoordinatorView: View {
    let store: StoreOf<RootCoordinator>
    
    public init(store: StoreOf<RootCoordinator>) {
        self.store = store
    }
    
    public var body: some View {
        
        TCARouter(store) { screen in
            SwitchStore(screen) { screen in
                switch screen {
                case .main:
                    CaseLet(
                        /RootScreen.State.main,
                        action: RootScreen.Action.main,
                        then: MainCoordinatorView.init
                    )
                }
            }
        }
    }
}

// MARK: - RootScreen
public struct RootScreen: Reducer {
    
    public enum State: Equatable {
        case main(MainCoordinator.State)
    }
    
    public enum Action {
        case main(MainCoordinator.Action)
    }
    
    public var body: some ReducerOf<Self> {
        Scope(state: /State.main, action: /Action.main) {
            MainCoordinator()
        }
    }
}
