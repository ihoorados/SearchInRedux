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

                ScrollView(.vertical) {

                    ForEach(responseItems, id: \.id) { item in

                        ResultCell(item: item)
                            .frame(
                                  minWidth: 0,
                                  maxWidth: .infinity,
                                  alignment: .leading
                                )
                            .background((Color("CellBackground")))
                            .cornerRadius(8)
                            .padding([.top,.leading,.trailing], 12)
                    }
                }


            }
        }
        .padding([.leading,.trailing,.top,.bottom], 0)
    }

    func FilterList(items:[SearchFilter]) -> some View{

        return ScrollView(.horizontal){

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
        .frame(height: 52)
        .padding([.leading,.trailing], 8)
    }

    func ResultCell(item: SearchResponse) -> some View{

        return HStack(spacing: 12){

            Image(systemName: item.image)
                .padding([.leading], 12)
                .foregroundColor(Color.red)
                .imageScale(.large)

            VStack(alignment: .leading, spacing: 6.0) {

                Text(item.title)
                    .font(.system(size: 19,weight: .bold))
                Text(item.subTitle)
                    .foregroundColor(.secondary)
                    .font(.system(size: 16))

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

            Spacer()
            VStack{
                Text(item.distanse)
                    .font(.system(size: 19, weight: .semibold))
                Text(item.distanseLabel)
                    .font(.system(size: 16, weight: .semibold))
            }
            .padding([.trailing], 12)
        }
        .padding([.leading,.trailing], 0)
        .padding([.top,.bottom], 12)

    }

    func activeSearchFilterCell(filter: SearchFilter) -> some View{

        return Button {

            // Action
            selectedFilter = filter

            } label: {

                // Body
                HStack{

                    Text(filter.title)
                        .padding([.leading,.trailing], 8.0)
                        .font(.system(size: 17,weight: .bold))
                        .cornerRadius(8)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("BlueColor"))

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
                        .padding([.leading,.trailing], 8.0)
                        .font(.system(size: 17,weight: .bold))
                        .cornerRadius(8)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("FilterLabelColor"))
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
            initialState: SearchState(subState: .response, entities: MockSearchType().mockSearchList()),
            reducer: AnyReducer.SearchReducer,
          environment: ()
        )
        ResponseSearchListSwiftUIView()
            .environmentObject(ViewStore(store))
    }
}
