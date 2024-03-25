//
//  MainView.swift
//  MainFeatureDemo
//
//  Created by Junyoung on 3/21/24.
//  Copyright © 2024 TuistTemplate. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

import MandalartFeatureInterface
import DesignKit

public struct MainView: View {
    
    let store: StoreOf<MainStore>
    
    @State private var selectedTab: Int = 0
    
    public init(
        store: StoreOf<MainStore>
    ) {
        self.store = store
    }
    
    public var body: some View {
        Text("hello")
    }
}
