//
//  MainFeature.swift
//  MainFeatureDemo
//
//  Created by Junyoung on 3/23/24.
//  Copyright © 2024 TuistTemplate. All rights reserved.
//

import ComposableArchitecture
import MandalartFeatureInterface

import SwiftUI

@Reducer
public struct MainStore: Reducer {
    
    let mandalartInterFace: MandalartInterface
    
    @ObservableState
    public struct State: Equatable {
        public static func == (lhs: MainStore.State, rhs: MainStore.State) -> Bool {
            return lhs._$id == rhs._$id
        }
        
        
        var mandalArtView: AnyView? = nil
        
        public init() {}
    }
    
    public enum Action: Equatable {
        case onAppear
    }
    
    public init(mandalartInterFace: MandalartInterface) {
        self.mandalartInterFace = mandalartInterFace
    }
    
    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.mandalArtView = mandalartInterFace.getMandalartView()
                return .none
            }
        }
    }
}
