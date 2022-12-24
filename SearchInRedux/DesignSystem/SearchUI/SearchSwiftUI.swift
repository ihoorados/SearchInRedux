//
//  SearchSwiftUI.swift
//  SearchInRedux
//
//  Created by Hoorad Ramezani on 24/12/2022.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct SearchSwiftUIView: View {

    @ObservedObject var viewStore: ViewStore<SearchState, SearchAction>
    @State var inputText: String = ""
    @State var searchFilter: Bool = false
    @FocusState private var serachTextFocus: Bool

    var body: some View {

        VStack(alignment: .leading){

            SearchBar()
                .background(Color.clear)

            switch viewStore.state.subState{
            case .loading:
                VStack{
                    ForEach((0...4).reversed(), id: \.self) { _ in
                        ShimmerView()
                            .cornerRadius(12)
                    }
                }.padding()
            case .search:
                DefaultSearchListSwiftUIView(defaultSelected: $inputText)
                    .environmentObject(viewStore)
                    .padding(.top, 4.0)
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
            case .response:

                ResponseSearchListSwiftUIView()
                    .environmentObject(viewStore)

            case .active:
                defaultList(items: viewStore.entities.defaultList)
                    .frame(height: 50.0)

//                ActiveSearchSwiftUI()
//                    .environmentObject(viewStore)
//                    .padding(.top, 4.0)
//                    .frame(maxWidth: .infinity)
            }
        }
        .background(viewStore.state.subState == .active ? Color(.clear) : Color(.systemBackground))
        .frame(maxWidth: 500)
    }
}

extension SearchSwiftUIView{


    func SearchBar() -> some View{

        return HStack{

            HStack {

                Button {

                    if viewStore.state.subState != .active{

                        serachTextFocus = false
                        viewStore.send(.onBack)
                    }

                } label: {

                    let name = viewStore.state.subState == .active ? "lock.shield.fill": "arrow.left"
                    Image(systemName: name)
                        .frame(width: 48.0,height: 48.0)
                        .foregroundColor(Color.primary)
                }

                TextField("Where to?", text: $inputText)
                    .background((Color("CellBackground")))
                    .disableAutocorrection(true)
                    .font(.system(size: 23,weight: .semibold))
                    .onSubmit {
                        viewStore.send(.onTextFeildChanged(inputText))
                    }
                    .onTapGesture {

                        viewStore.send(.onTextFeildChanged(""))
                    }
                    .focused($serachTextFocus)

                .frame(height: 58.0)

                Button {

                } label: {
                    Image(systemName: "mic.fill")
                        .frame(width: 48.0,height: 48.0)
                        .foregroundColor(Color("FilterLabelColor"))
                }


               }
                .padding(.leading, 8.0)
                .padding(.trailing, 12)
                .background(RoundedRectangle(cornerRadius: 30).fill(Color("CellBackground")))

        }
        .padding([.top,.bottom], 0)
        .padding([.leading,.trailing], 8)
    }


    func defaultList(items:[DefaultSuggestion]) -> some View{

        return ScrollViewRTL(type: .hList){
            HStack{

                ForEach(items, id: \.id) { item in
                    defaultCell(title: item.title,image: item.image)
                }
            }
            .padding([.leading,.trailing], 8)
        }
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
            .padding([.leading,.trailing,.top,.bottom], 8)
            .background((Color("CellBackground")))
            .cornerRadius(22)
            .buttonStyle(PlainButtonStyle())
        }
    }


}

//@available(iOS 16.0, *)
struct SearchSwiftUIView_Previews: PreviewProvider {

    static var previews: some View {

        let store: Store<SearchState, SearchAction> = .init(
            initialState: SearchState(subState: .active, entities: MockSearchType().mockSearchList()),
            reducer: AnyReducer.SearchReducer,
          environment: ()
        )
        SearchSwiftUIView(viewStore: ViewStore(store))
    }
}
