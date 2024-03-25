//
//  SettingView.swift
//  SettingFeatureDemo
//
//  Created by Junyoung on 3/24/24.
//  Copyright © 2024 TuistTemplate. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

public struct SettingView: View {
    let store: StoreOf<SettingStore>
    
    public init(store: StoreOf<SettingStore>) {
        self.store = store
    }
    
    public var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//#Preview {
//    SettingView()
//}
