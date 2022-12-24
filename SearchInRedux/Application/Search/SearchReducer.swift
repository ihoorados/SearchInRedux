//
//  SearchReducer.swift
//  SearchInRedux
//
//  Created by Hoorad Ramezani on 24/12/2022.
//

import Foundation
import ComposableArchitecture
import CoreLocation

extension AnyReducer where State == SearchState, Action == SearchAction, Environment == Void {

    static var SearchReducer = AnyReducer { (state: inout SearchState, action: SearchAction, _: Void) in

        // strat
        switch action {
        case .onTextFeildChanged(let text):

            guard text != "" else {

                state.subState = .search
                return .none
            }
            state.subState = .loading
            return Effect.task {
                try await Task.sleep(nanoseconds: NSEC_PER_SEC)
                return SearchAction.onResultRecived(MockSearchType().mockSearchResponse())
              }
              .eraseToEffect()
        case .onResultRecived(let response):

            state.response = response
            state.subState = .response
            return .none
        case .onFilterSelected(id: let id):

            return .none
        case .onBack:

            state.subState = .active
            return .none
        }
        // end

    }
}
