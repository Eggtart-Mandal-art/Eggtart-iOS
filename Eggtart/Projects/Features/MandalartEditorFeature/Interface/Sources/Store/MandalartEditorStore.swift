//
//  MandalartEditorCore.swift
//  MandalartEditorFeatureDemo
//
//  Created by Junyoung on 3/24/24.
//  Copyright © 2024 TuistTemplate. All rights reserved.
//

import Foundation

import ComposableArchitecture

@Reducer
public struct MandalartEditorStore {
    @ObservableState
    public struct State: Equatable {
        
        let selectedCardNumber: Int
        
        public init(selectedCardNumber: Int) {
            self.selectedCardNumber = selectedCardNumber
        }
    }
    
    public enum Action: Equatable {
        
    }
    
    public init() {}
    
    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            return .none
        }
    }
}
