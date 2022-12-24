//
//  SearchInReduxApp.swift
//  SearchInRedux
//
//  Created by Hoorad Ramezani on 24/12/2022.
//

import SwiftUI
import ComposableArchitecture

@main
struct SearchInReduxApp: App {

    let store: Store<SearchState, SearchAction> = .init(
        initialState: SearchState(subState: .active, entities: MockSearchType().mockSearchList()),
        reducer: AnyReducer.SearchReducer,
      environment: ()
    )

    var body: some Scene {
        
        WindowGroup {
            ContentView(store: store)
        }
    }
}
