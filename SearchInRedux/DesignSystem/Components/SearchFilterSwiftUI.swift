//
//  SearchFilterSwiftUI.swift
//  SearchInRedux
//
//  Created by Hoorad Ramezani on 24/12/2022.
//

import Foundation
import SwiftUI

struct SearchFilterSwiftUIView: View {

    @Environment(\.dismiss) var dismiss
    @State var item: SearchFilter
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]

    var body: some View {

        VStack(alignment: .leading, content: {

            HStack{
                Text(item.title)
                    .font(.system(size: 19))
                Spacer()
            }
            filterList()
            HStack{
                Text("اعمال فیلتر")
                    .frame(width: 200)
                    .frame(height: 44)
                    .font(.system(size: 21))
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .cornerRadius(24)

                Button {

                } label: {
                    Text("حذف فیلتر")
                        .frame(height: 44)
                        .font(.system(size: 21))
                        .foregroundColor(Color.primary)
                }
            }
        })

    }

    func filterList() -> some View{

        return ScrollView {

            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(item.filterItems, id: \.id) { item in

                    switch item.isSelected{
                    case true:
                        activeSearchFilterCell(item: item)
                            .frame(height: 48)
                    case false:
                        deActiveFilterCell(item: item)
                            .frame(height: 48)
                    }
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: 180)
    }

    func activeSearchFilterCell(item: FilterItem) -> some View{

        return Button {
            // Action
            } label: {

                // Body
                HStack{

                    Image(systemName: "checkmark")
                        .padding([.leading], 15)
                        .foregroundColor(Color("FilterActiveLabelColor"))
                        .imageScale(.medium)

                    Text(item.title)
                        .padding([.trailing], 15)
                        .frame(height: 44)
                        .font(.system(size: 21))
                        .cornerRadius(8)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("FilterActiveLabelColor"))
                        .fixedSize()
                }
                .background(Color("FilterActiveBackground"))
                .buttonStyle(PlainButtonStyle())
                .cornerRadius(8.0)
            }
    }

    func deActiveFilterCell(item: FilterItem) -> some View{

        return Button {

            // Action

            } label: {

                // Body
                HStack{
                    Text(item.title)
                        .padding([.leading,.trailing], 12)
                        .font(.system(size: 21))
                        .cornerRadius(8)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("FilterLabelColor"))

                }
                .frame(height: 44)
                .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(Color("FilterActiveBorderColor"), lineWidth: 2))
            }
    }
}

struct SearchFilterSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            SearchFilterSwiftUIView(item: MockSearchType().mockFilterList()[2])
        } else {
            // Fallback on earlier versions
        }
    }
}
