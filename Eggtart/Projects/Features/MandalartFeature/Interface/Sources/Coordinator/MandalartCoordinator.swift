//
//  MandalartCoordinator.swift
//  MandalartFeatureDemo
//
//  Created by Junyoung on 3/24/24.
//  Copyright © 2024 TuistTemplate. All rights reserved.
//

import ComposableArchitecture
import TCACoordinators
import SwiftUI

import MandalartEditorFeatureInterface

public struct MandalartCoordinator: Reducer {
    public struct State: Equatable, IndexedRouterState {
        
        public static let initialState: MandalartCoordinator.State = .init()
        
        public var routes: [Route<MandalartScreen.State>] = [
            .root(.mandalart(.init()),
                  embedInNavigationView: true)
        ]
        
        public init() {}
    }
    
    public enum Action: IndexedRouterAction {
        case routeAction(Int, action: MandalartScreen.Action)
        case updateRoutes([Route<MandalartScreen.State>])
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            case .routeAction(_, action: .mandalart(.tappedMandalart(let index))):
                print("버튼 \(index) 탭됨")
                state.routes.presentSheet(.mandalartEditor(.init(selectedCardNumber: index)))
                return .none
            case .updateRoutes(_):
                state.routes.popLast()
                return .none
            default:
                break
            }
            return .none
        }.forEachRoute {
            MandalartScreen()
        }
    }
    
}

public struct MandalartCoordinatorView: View {
    let store: StoreOf<MandalartCoordinator>
    
    public init(store: StoreOf<MandalartCoordinator>) {
        self.store = store
    }
    
    public var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) { screen in
                switch screen {
                case .mandalart:
                    CaseLet(
                        /MandalartScreen.State.mandalart,
                        action: MandalartScreen.Action.mandalart,
                        then: MandalartView.init
                    )
                case .mandalartEditor:
                    CaseLet(
                        /MandalartScreen.State.mandalartEditor,
                        action: MandalartScreen.Action.mandalartEditor,
                        then: MandalartEditorView.init
                    )
                }
            }
        }
    }
}

public struct MandalartScreen: Reducer {
    
    public enum State: Equatable {
        case mandalart(MandalartStore.State)
        case mandalartEditor(MandalartEditorStore.State)
    }
    
    public enum Action {
        case mandalart(MandalartStore.Action)
        case mandalartEditor(MandalartEditorStore.Action)
    }
    
    public var body: some ReducerOf<Self> {
        Scope(state: /State.mandalart, action: /Action.mandalart) {
            MandalartStore()
        }
        
        Scope(state: /State.mandalartEditor, action: /Action.mandalartEditor) {
            MandalartEditorStore()
        }
    }
}
