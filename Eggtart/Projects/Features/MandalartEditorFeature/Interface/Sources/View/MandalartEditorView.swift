//
//  MandalrtEditorView.swift
//  MandalartEditorFeatureDemo
//
//  Created by Junyoung on 3/24/24.
//  Copyright © 2024 TuistTemplate. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

public struct MandalartEditorView: View {

    let store: StoreOf<MandalartEditorStore>
    
    public init(store: StoreOf<MandalartEditorStore>) {
        self.store = store
    }
    
    public var body: some View {
        Text("number : \(store.selectedCardNumber)")
    }
    
    public func getView() -> any View {
        return MandalartEditorView.init(store: .init(initialState: MandalartEditorStore.State(selectedCardNumber: 1), reducer: {
            MandalartEditorStore()
        }))
    }
    
}

#Preview {
    MandalartEditorView(store: .init(initialState: MandalartEditorStore.State(selectedCardNumber: 5), reducer: {
        MandalartEditorStore()
    }))
}
