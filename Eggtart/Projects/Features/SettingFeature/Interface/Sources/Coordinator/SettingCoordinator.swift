//
//  SettingCoordinator.swift
//  SettingFeatureDemo
//
//  Created by Junyoung on 3/24/24.
//  Copyright © 2024 TuistTemplate. All rights reserved.
//

import ComposableArchitecture
import TCACoordinators
import SwiftUI

public struct SettingCoordinator: Reducer {
    public struct State: Equatable, IndexedRouterState {
        public static let initialState: SettingCoordinator.State = .init()
        
        public var routes: [Route<SettingScreen.State>] = [
            .root(.setting(.init()),
                  embedInNavigationView: true)
        ]
        
        public init() {}
    }
    
    public enum Action: IndexedRouterAction {
        case routeAction(Int, action: SettingScreen.Action)
        case updateRoutes([Route<SettingScreen.State>])
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .routeAction(_, action: .setting):
                return .none
            case .updateRoutes(_):
                return .none
            default:
                break
            }
            return .none
        }.forEachRoute {
            SettingScreen()
        }
    }
    
}

public struct SettingCoordinatorView: View {
    let store: StoreOf<SettingCoordinator>
    
    public init(store: StoreOf<SettingCoordinator>) {
        self.store = store
    }
    
    public var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) { screen in
                CaseLet(
                    /SettingScreen.State.setting,
                    action: SettingScreen.Action.setting,
                    then: SettingView.init
                )
            }
        }
    }
}

public struct SettingScreen: Reducer {
    
    public enum State: Equatable {
        case setting(SettingStore.State)
    }
    
    public enum Action {
        case setting(SettingStore.Action)
    }
    
    public var body: some ReducerOf<Self> {
        Scope(state: /State.setting, action: /Action.setting) {
            SettingStore()
        }
        
    }
}
