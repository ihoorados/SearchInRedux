//
//  ContentView.swift
//  SearchInRedux
//
//  Created by Hoorad Ramezani on 24/12/2022.
//

import SwiftUI
import MapKit
import ComposableArchitecture

struct ContentView: View {

    let store: Store<SearchState, SearchAction>

    @State private var region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: 40.83834587046632,
                    longitude: 14.254053016537693),
                span: MKCoordinateSpan(
                    latitudeDelta: 0.03,
                    longitudeDelta: 0.03)
                )

    var body: some View {

        ZStack(alignment: .top) {

            Map(coordinateRegion: $region)
                .edgesIgnoringSafeArea(.all)
            SearchSwiftUIView(viewStore: ViewStore(store))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {

        let store: Store<SearchState, SearchAction> = .init(
            initialState: SearchState(subState: .active, entities: MockSearchType().mockSearchList()),
            reducer: AnyReducer.SearchReducer,
          environment: ()
        )
        ContentView(store: store)
    }
}
