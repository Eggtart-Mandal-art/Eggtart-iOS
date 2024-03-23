//
//  Screen.swift
//  RootFeature
//
//  Created by Junyoung on 3/23/24.
//  Copyright © 2024 TuistTemplate. All rights reserved.
//

import ComposableArchitecture

import MainFeature
import MandalartFeature

public struct Screen: Reducer {
    
    public enum State: Equatable {
        case main(MainStore.State)
        case mandalart(MandalartStore.State)
    }
    
    public enum Action {
        case main(MainStore.Action)
        case mandalart(MandalartStore.Action)
    }
    
    public var body: some ReducerOf<Self> {
        Scope(state: /State.main, action: /Action.main) {
            MainStore(
                mandalartInterFace: MandalartView.init(
                    store: .init(
                        initialState: MandalartStore.State(),
                        reducer: {
                            MandalartStore()
                        }
                    )
                )
            )
        }
        
        Scope(state: /State.mandalart, action: /Action.mandalart) {
            MandalartStore()
        }
    }
}
