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

public struct MainView: View {
    
    let store: StoreOf<MainStore>
    
    public init(
        store: StoreOf<MainStore>
    ) {
        self.store = store
    }
    
    public var body: some View {
        
        TabView {
            VStack {
                if let view = store.mandalArtView {
                    view
                }
                Spacer()
                Divider()
            }
            .tabItem {
                Image(systemName: "1.square.fill")
                Text("First")
            }
            
            Text("4")
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
                    
                }
            
            Text("3")
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
                    
                }
            
            Text("2")
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
                    
                }
        }
        .onAppear(perform: {
            store.send(.onAppear)
        })
    }
}

//#Preview {
//    MainView(store: .init(initialState: MainStore.State(), reducer: {
//        MainStore(mandalartInterFace: <#T##MandalartInterface#>)
//    }))
//}
