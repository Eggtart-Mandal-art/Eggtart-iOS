//
//  MandalartView.swift
//  MandalartFeature
//
//  Created by Junyoung on 3/22/24.
//  Copyright © 2024 TuistTemplate. All rights reserved.
//

import SwiftUI
import MandalartFeatureInterface
import ComposableArchitecture

public struct MandalartView: View, MandalartInterface {
    
    let store: StoreOf<MandalartStore>
    
    public init(store: StoreOf<MandalartStore>) {
        self.store = store
    }
    
    public var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    public func getMandalartView() -> AnyView {
        return AnyView(MandalartView(store: .init(initialState: MandalartStore.State(), reducer: {
            MandalartStore()
        })))
    }
}

//#Preview {
//    MandalartView()
//}
