//
//  ActiveSearchSwiftUI.swift
//  SearchInRedux
//
//  Created by Hoorad Ramezani on 24/12/2022.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct ActiveSearchSwiftUI: View {

    @EnvironmentObject var viewStore: ViewStore<SearchState, SearchAction>
//    @Binding var defaultSelected : String

    var body: some View {

        VStack(spacing: 12){

            defaultList(items: viewStore.entities.defaultList)
        }
    }

    func defaultList(items:[DefaultSuggestion]) -> some View{

        return ScrollViewRTL(type: .hList){
            HStack{

                ForEach(items, id: \.id) { item in
                    defaultCell(title: item.title,image: item.image)
                        .frame(height: 44)
                }
            }
        }
        .padding([.leading,.trailing], 4)
    }

    func defaultCell(title: String, image: String) -> some View{

        return Button {

            // Action
            //            defaultSelected = title

        } label: {

            // Body
            HStack{

                Image(systemName: image)
                    .padding([.leading], 12.0)
                    .foregroundColor(Color("FilterLabelColor"))
                    .imageScale(.small)

                Text(title)
                    .padding([.trailing], 12.0)
                    .font(.system(size: 19))
                    .cornerRadius(8)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color("FilterLabelColor"))
            }
            .background(Color(.systemBackground))
            .cornerRadius(22)
            .buttonStyle(PlainButtonStyle())
        }
    }
}


struct DefaultSearchListSwiftUIView_Previews: PreviewProvider {

    static var previews: some View {

        let store: Store<SearchState, SearchAction> = .init(
            initialState: SearchState(subState: .active, entities: MockSearchType().mockSearchList()),
            reducer: AnyReducer.SearchReducer,
          environment: ()
        )
        ActiveSearchSwiftUI()
            .environmentObject(ViewStore(store))
    }
}
