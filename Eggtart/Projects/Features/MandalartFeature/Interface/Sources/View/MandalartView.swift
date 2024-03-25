//
//  MandalartView.swift
//  MandalartFeatureDemo
//
//  Created by Junyoung on 3/24/24.
//  Copyright © 2024 TuistTemplate. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

public struct MandalartView: View {
    
    let store: StoreOf<MandalartStore>
    
    public init(store: StoreOf<MandalartStore>) {
        self.store = store
    }
    
    let columns = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]
    
    public var body: some View {
        VStack {
            LazyVGrid(columns: columns) {
                ForEach(0..<9) { index in
                    Button(action: {
                        store.send(.tappedMandalart(index))
                    }) {
                        // Center
                        if index == 4 {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.orange)
                                .aspectRatio(1, contentMode: .fit)
                                .overlay(
                                    Text("중앙 카드")
                                        .foregroundColor(.white)
                                )
                        } else {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.gray)
                                .aspectRatio(1, contentMode: .fit)
                                .overlay(
                                    Text("\(index) 카드")
                                        .foregroundColor(.white)
                                )
                        }
                    }
                }
            }
        }
        .padding(.all, 16)
    }
}


extension MandalartView {
    public func getMandalartView() -> AnyView {
        return AnyView(MandalartView(store: .init(initialState: MandalartStore.State(), reducer: {
            MandalartStore()
        })))
    }
}

#Preview {
    MandalartView(store: .init(initialState: MandalartStore.State(), reducer: {
        MandalartStore()
    }))
}

