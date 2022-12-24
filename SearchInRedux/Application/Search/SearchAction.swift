//
//  SearchAction.swift
//  SearchInRedux
//
//  Created by Hoorad Ramezani on 24/12/2022.
//

import Foundation

enum SearchAction{

    case onBack
    case onTextFeildChanged(String)
    case onResultRecived(SearchResponseModel)
    case onFilterSelected(id: UUID)
}
