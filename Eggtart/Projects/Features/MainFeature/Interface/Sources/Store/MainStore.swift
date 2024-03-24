//
//  MainFeature.swift
//  MainFeatureDemo
//
//  Created by Junyoung on 3/23/24.
//  Copyright © 2024 TuistTemplate. All rights reserved.
//

import ComposableArchitecture
import TCACoordinators
import SwiftUI

@Reducer
public struct MainStore: Reducer {
    
    @ObservableState
    public struct State: Equatable {
        
        public init() {}
    }
    
    public enum Action: Equatable {
        case onAppear
    }
    
    public init() { }
    
    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .none
            }
        }
    }
}
