//
//  SearchType.swift
//  SearchInRedux
//
//  Created by Hoorad Ramezani on 24/12/2022.
//

import Foundation


// SerachModel
struct DefaultSerachModel: Equatable{

    let id: UUID = UUID()
    var defaultList: [DefaultSuggestion]
    var recentlySearchedList: [RecentlySearched]
}

struct DefaultSuggestion: Equatable{

    let id: UUID = UUID()
    let title: String
    let image: String
}

struct RecentlySearched: Equatable {

    let id: UUID = UUID()
    let title: String
    let subTitle: String
}

// SerachResponseModel
struct SearchResponseModel: Equatable{

    let id: UUID = UUID()
    var filterList: [SearchFilter]
    var responseList: [SearchResponse]
}

struct SearchResponse: Equatable {

    let id: UUID = UUID()
    let title: String
    let subTitle: String
    let distanse: String
    let distanseLabel: String
    let image: String
}

struct SearchFilter: Equatable,Identifiable{

    let id: UUID = UUID()
    let title: String
    let isSelected: Bool
    let filterItems: [FilterItem]
}

struct FilterItem: Equatable,Identifiable{

    let id: UUID = UUID()
    let title: String
    let isSelected: Bool
}
