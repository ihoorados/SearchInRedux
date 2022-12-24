//
//  ResponseSearchListSwfitUI.swift
//  SearchInRedux
//
//  Created by Hoorad Ramezani on 24/12/2022.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct ResponseSearchListSwiftUIView: View {

    @EnvironmentObject var viewStore: ViewStore<SearchState, SearchAction>
    @State var selectedFilter: SearchFilter? = nil

    var body: some View {

        VStack{

            if let filterItems = viewStore.response?.filterList{
                FilterList(items: filterItems)
                    .padding(.top, 4.0)
                    .frame(maxWidth: .infinity)
            }

            if let responseItems = viewStore.response?.responseList{
                ResultList(items: responseItems)
                    .padding(.top, 4.0)
                    .frame(maxWidth: .infinity)
            }
        }
    }

    func FilterList(items:[SearchFilter]) -> some View{

        return ScrollViewRTL(type: .hList){

            HStack{

                Image(systemName: "line.3.horizontal.decrease.circle")
                    .imageScale(.large)

                ForEach(viewStore.response?.filterList ?? [], id: \.id) { filter in
                    switch filter.isSelected{
                    case true:
                        activeSearchFilterCell(filter: filter)
                    case false:
                        deActiveFilterCell(filter: filter)
                    }
                }
                .sheet(item: $selectedFilter) { item in

                    SearchFilterSwiftUIView(item: item)
                        .presentationDetents([.fraction(0.3)])
                        .presentationDragIndicator(.hidden)
                }
            }
        }
        .padding([.leading,.trailing], 8)
    }

    func ResultList(items: [SearchResponse]) -> some View{

        ScrollView(.vertical){
            return HStack{
                VStack(spacing: 8){
                    ForEach(items, id: \.id) { item in
                        ResultCell(item: item)
                            .background(Color("CellBackground"))
                            .cornerRadius(8)
                    }
                }
                .padding([.leading,.trailing],8)
            }
       }
        .padding([.leading,.trailing], 0)
    }

    func ResultCell(item: SearchResponse) -> some View{

        return HStack(spacing: 12){

            Image(systemName: item.image)
                .padding(.leading)
                .foregroundColor(Color.red)
                .imageScale(.large)

            VStack(alignment: .leading, spacing: 4.0) {


                Text(item.title)
                    .font(.system(size: 21,weight: .bold))
                Text(item.subTitle)
                    .font(.system(size: 18))

                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                    Image(systemName: "star")
                        .foregroundColor(Color.primary)
                    Text("157 vote")
                        .font(.system(size: 17, weight: .semibold))
                }
            }
            .padding(.top)
            .padding(.bottom)

            VStack{
                Text(item.distanse)
                    .font(.system(size: 19, weight: .semibold))
                Text(item.distanseLabel)
                    .font(.system(size: 16, weight: .semibold))
            }
            .padding(.trailing)
        }
    }

    func activeSearchFilterCell(filter: SearchFilter) -> some View{

        return Button {

            // Action
            selectedFilter = filter

            } label: {

                // Body
                HStack{

                    Text(filter.title)
                        .padding([.leading], 8.0)
                        .font(.system(size: 21))
                        .cornerRadius(8)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("BlueColor"))

                    Image(systemName: "hand.tap.fill")
                        .padding([.trailing], 8.0)
                        .foregroundColor(Color("FilterActiveLabelColor"))

                }
                .frame(height: 44)
                .background(Color("FilterActiveBackground"))
                .buttonStyle(PlainButtonStyle())
                .cornerRadius(8.0)
            }
            .padding([.top, .bottom], 4)
    }

    func deActiveFilterCell(filter: SearchFilter) -> some View{

        return Button {

            // Action
            selectedFilter = filter

            } label: {

                // Body
                HStack{

                    Text(filter.title)
                        .padding([.leading], 8.0)
                        .font(.system(size: 21))
                        .cornerRadius(8)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("FilterLabelColor"))

                    Image(systemName: "hand.tap.fill")
                        .padding([.trailing], 8.0)
                        .foregroundColor(Color("FilterLabelColor"))
                        .imageScale(.small)
                }
                .frame(height: 44)
                .overlay(RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color("FilterActiveBorderColor"), lineWidth: 2))
                .buttonStyle(PlainButtonStyle())
            }
    }
}

struct ResponseSearchListSwiftUIView_Previews: PreviewProvider {

    static var previews: some View {

        let store: Store<SearchState, SearchAction> = .init(
            initialState: SearchState(subState: .search, entities: MockSearchType().mockSearchList()),
            reducer: AnyReducer.SearchReducer,
          environment: ()
        )
        ResponseSearchListSwiftUIView()
            .environmentObject(ViewStore(store))
    }
}
