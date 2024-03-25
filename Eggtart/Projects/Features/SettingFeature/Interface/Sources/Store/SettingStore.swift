//
//  SettingStore.swift
//  SettingFeatureDemo
//
//  Created by Junyoung on 3/24/24.
//  Copyright © 2024 TuistTemplate. All rights reserved.
//

import Foundation

import ComposableArchitecture
import TCACoordinators

public struct SettingStore: Reducer {
    
    public struct State: Equatable {
        
        public init() {}
    }
    
    public enum Action: Equatable {
        case tappedButton
        case tappedMandalart(Int)
    }
    
    public init() {}
    
    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .tappedButton:
                return .none
            case .tappedMandalart:
                return .none
            }
        }
    }
}
