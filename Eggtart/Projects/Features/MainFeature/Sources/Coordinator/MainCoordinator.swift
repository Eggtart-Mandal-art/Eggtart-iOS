//
//  MainCoordinator.swift
//  MainFeatureDemo
//
//  Created by Junyoung on 3/24/24.
//  Copyright © 2024 TuistTemplate. All rights reserved.
//

import ComposableArchitecture
import TCACoordinators
import SwiftUI

import MandalartFeatureInterface
import SettingFeatureInterface
import Shared
import DesignKit

// MARK: - Coordinator
public struct MainCoordinator: Reducer {
    
    public struct State: Equatable {
        
        public var mandalart: MandalartCoordinator.State = MandalartCoordinator.State.initialState
        var setting: SettingCoordinator.State = SettingCoordinator.State.initialState
        public var selectedTab: TabBarType = .mandalart
        
        public init() { }
    }
    
    public enum Action {
        case mandalart(MandalartCoordinator.Action)
        case setting(SettingCoordinator.Action)
        case selectTab(TabBarType)
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        
        Scope(state: \.mandalart, action: /Action.mandalart) {
            MandalartCoordinator()
        }
        
        Scope(state: \.setting, action: /Action.setting) {
            SettingCoordinator()
        }
        
        Reduce<State, Action> { state, action in
            switch action {
            case .selectTab(let tab):
                state.selectedTab = tab
                return .none
            default: break
            }
            return .none
        }
    }
}

// MARK: - CoordinatorView
public struct MainCoordinatorView: View {
    let store: StoreOf<MainCoordinator>
    
    public init(store: StoreOf<MainCoordinator>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(store, observe: \.selectedTab) { viewStore in
            TabView(selection: viewStore.binding(get: { $0 }, send: MainCoordinator.Action.selectTab), content:  {
                
                Group {
                    VStack {
                        Spacer()
                        MandalartCoordinatorView(
                            store: store.scope(
                                state: { $0.mandalart },
                                action: { .mandalart($0)}
                            )
                        )
                        Spacer()
                        Divider()
                    }
                    .tag(TabBarType.mandalart)
                    .tabItem {
                        Image.gridonRounded
                        Text("만다르트")
                    }
                    
                    VStack {
                        Spacer()
                        SettingCoordinatorView(
                            store: store.scope(
                                state: { $0.setting },
                                action: { .setting($0) }
                            )
                        )
                        Spacer()
                        Divider()
                    }
                    .tag(TabBarType.setting)
                    .tabItem {
                        Image.settingsRounded
                        Text("설정")
                    }
                }
                
            })
            
        }
    }
    
    // MARK: - RootScreen
//    public struct MainScreen: Reducer {
//        
//        public enum State: Equatable {
//            case mandalart(MandalartStore.State)
//            case setting(SettingStore.State)
//        }
//        
//        public enum Action {
//            case mandalart(MandalartStore.Action)
//            case setting(SettingStore.Action)
//        }
//        
//        public var body: some ReducerOf<Self> {
//            Scope(state: /State.mandalart, action: /Action.mandalart) {
//                MandalartStore()
//            }
//            
//            Scope(state: /State.setting, action: /Action.setting) {
//                SettingStore()
//            }
//        }
//    }
}
