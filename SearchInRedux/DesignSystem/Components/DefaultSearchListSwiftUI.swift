//
//  SefaultSearchListSwiftUI.swift
//  SearchInRedux
//
//  Created by Hoorad Ramezani on 24/12/2022.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct DefaultSearchListSwiftUIView: View {

    @EnvironmentObject var viewStore: ViewStore<SearchState, SearchAction>
    @Binding var defaultSelected : String

    var body: some View {

        VStack(spacing: 12){

            defaultList(items: viewStore.entities.defaultList)
            favList()
                .frame(height: 60)
            recentlySerachList(items: viewStore.entities.recentlySearchedList)
            Spacer()
        }.background(Color.clear)

    }

    func recentlySerachList(items:[RecentlySearched]) -> some View{

        return ScrollViewRTL(type: .vList){

            ForEach(items, id: \.id) { item in
                recentlySearchedCell(item: item)
                    .background(Color("CellBackground"))

            }
        }
        .background(Color("ColorBackground"))
        .padding([.leading,.trailing], 0)
    }


    func defaultList(items:[DefaultSuggestion]) -> some View{

        return ScrollViewRTL(type: .hList){
            HStack{

                ForEach(items, id: \.id) { item in
                    defaultCell(title: item.title,image: item.image)
                }
            }
        }
        .padding([.leading,.trailing], 4)
    }

    func favList() -> some View{

        return ScrollViewRTL(type: .hList){

            HStack{

                home()
                Rectangle()
                    .padding([.top], 4.0)
                    .frame(width: 2, height: 20)
                    .foregroundColor(Color.gray.opacity(0.2))
                workPlace()
                Rectangle()
                    .padding([.top], 4.0)
                    .frame(width: 2, height: 20)
                    .foregroundColor(Color.gray.opacity(0.2))
                personalPoint()
                Rectangle()
                    .padding([.top], 4.0)
                    .frame(width: 2, height: 20)
                    .foregroundColor(Color.gray.opacity(0.2))
            }
        }
        .padding([.leading,.trailing], 0)
        .frame(height: 60)
        .background(Color("CellBackground"))
    }

    func defaultCell(title: String, image: String) -> some View{

        return Button {

            // Action
            defaultSelected = title

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
                .frame(height: 44)
                .background(Color("CellBackground"))
                .cornerRadius(22)
                .buttonStyle(PlainButtonStyle())
            }
    }

    func recentlySearchedCell(item: RecentlySearched) -> some View{

        VStack(alignment: .leading,spacing: 8){

            HStack(alignment: .top){

                Image(systemName: "clock.arrow.circlepath")
                    .padding([.leading,.top], 12.0)
                    .foregroundColor(Color("FilterLabelColor"))
                    .imageScale(.large)

                Text(item.title)
                    .padding([.trailing,.top], 12.0)
                    .font(.system(size: 21))
                    .cornerRadius(8)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color("FilterLabelColor"))
            }

            Text(item.subTitle)
                .padding([.leading,.bottom], 12.0)
                .font(.system(size: 21))
                .cornerRadius(8)
                .multilineTextAlignment(.leading)
                .padding([.top], 2.0)
                .foregroundColor(Color.gray)

            Rectangle()
                .padding([.top], 4.0)
                .frame(height: 2)
                .foregroundColor(Color.gray.opacity(0.1))
                .padding([.leading,.trailing], 12.0)

        }
    }

    func home() -> some View{

        return Button {

            // Action
            
            } label: {

                // Body
                HStack{

                    Image(systemName: "house.fill")
                        .padding([.leading], 12.0)
                        .foregroundColor(Color("BlueColor"))
                        .imageScale(.large)

                    Text("Home")
                        .padding([.trailing], 12.0)
                        .font(.system(size: 21,weight: .semibold))
                        .cornerRadius(8)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("BlueColor"))
                }
            }
    }

    func workPlace() -> some View{

        return Button {

            // Action

            } label: {

                // Body
                HStack{

                    Image(systemName: "briefcase.fill")
                        .padding([.leading], 12.0)
                        .foregroundColor(Color("BlueColor"))
                        .imageScale(.large)

                    Text("Work")
                        .font(.system(size: 21,weight: .semibold))
                        .padding([.trailing], 12.0)
                        .cornerRadius(8)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("BlueColor"))
                }
            }
    }

    func personalPoint() -> some View{

        return Button {

            // Action

            } label: {

                // Body
                HStack{

                    Image(systemName: "star.fill")
                        .padding([.leading], 12.0)
                        .foregroundColor(Color.yellow)
                        .imageScale(.large)

                    Text("Personal Point")
                        .font(.system(size: 21,weight: .semibold))
                        .cornerRadius(8)
                        .multilineTextAlignment(.leading)
                        .padding([.trailing], 12.0)
                        .foregroundColor(Color.primary)
                }
            }
    }

}



//
//struct DefaultSearchListSwiftUIView_Previews: PreviewProvider {
//
//    static var previews: some View {
//
//        let store: Store<SearchState, SearchAction> = .init(
//            initialState: SearchState(subState: .search, entities: MockSearchType().mockSearchList()),
//            reducer: AnyReducer.SearchReducer,
//          environment: ()
//        )
//        DefaultSearchListSwiftUIView(defaultSelected: $inputText)
//            .environmentObject(ViewStore(store))
//    }
//}
