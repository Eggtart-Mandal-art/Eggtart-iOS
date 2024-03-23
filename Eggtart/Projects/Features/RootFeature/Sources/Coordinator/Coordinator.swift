//
//  Coordinator.swift
//  RootFeature
//
//  Created by Junyoung on 3/23/24.
//  Copyright © 2024 TuistTemplate. All rights reserved.
//

import ComposableArchitecture
import TCACoordinators

public struct Coordinator: Reducer {
    public struct State: Equatable, IndexedRouterState {
        public var routes: [Route<Screen.State>]
        
        public init(routes: [Route<Screen.State>]) {
            self.routes = routes
        }
    }
    
    public enum Action: IndexedRouterAction {
        case routeAction(Int, action: Screen.Action)
        case updateRoutes([Route<Screen.State>])
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .routeAction(_, action: .main):
                break
            case .routeAction(_, action: .mandalart):
                break
            case .updateRoutes(_):
                break
            default: 
                break
            }
            return .none
        }.forEachRoute {
            Screen()
        }
    }
    
}
