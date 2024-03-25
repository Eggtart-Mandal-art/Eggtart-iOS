//
//  MandalartStore.swift
//  MandalartFeatureDemo
//
//  Created by Junyoung on 3/23/24.
//  Copyright © 2024 TuistTemplate. All rights reserved.
//

import ComposableArchitecture
import TCACoordinators

public struct MandalartStore: Reducer {
    
    public struct State: Equatable {
        
        public init() {}
    }
    
    public enum Action: Equatable {
        case tappedMandalart(Int)
    }
    
    public init() {}
    
    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .tappedMandalart(let cardNumber):
                print(cardNumber)
                return .none
            }
        }
    }
}
