//
//  MockSearchType.swift
//  SearchInRedux
//
//  Created by Hoorad Ramezani on 24/12/2022.
//

import Foundation

public struct MockSearchType{

    func mockSearchList() -> DefaultSerachModel{

        return DefaultSerachModel(defaultList: mockDefaultList(), recentlySearchedList: recentlySearchedList())
    }

    func mockSearchResponse() -> SearchResponseModel{

        return SearchResponseModel(filterList: mockFilterList(), responseList: mockResultList())
    }

    func recentlySearchedList() -> [RecentlySearched]{

        let recently0 = RecentlySearched(title: "Rajabali zade drog store", subTitle: "Mashhad, farahani street, vakilabad 7")
        let recently1 = RecentlySearched(title: "Rajabali zade drog store", subTitle:  "Mashhad, farahani street, vakilabad 7")
        let recently2 = RecentlySearched(title: "Rajabali zade drog store", subTitle:  "Mashhad, farahani street, vakilabad 7")

        return [recently0,recently1,recently2]

    }

    func mockDefaultList() -> [DefaultSuggestion]{

        let default0 = DefaultSuggestion(title: "Vaccine",image: "syringe.fill")
        let default1 = DefaultSuggestion(title: "Transfusion", image: "ivfluid.bag.fill")
        let default2 = DefaultSuggestion(title: "Hospital",image: "cross.circle.fill")
        let default3 = DefaultSuggestion(title: "Gas",image: "fuelpump.fill")
        let default4 = DefaultSuggestion(title: "Drog",image: "pills.circle.fill")
        return [default0,default1,default2,default3,default4]
    }

    func mockFilterList() -> [SearchFilter]{


        let filter0 = SearchFilter(title: "Related", isSelected: true,
                                   filterItems: [FilterItem(title: "عنوان5", isSelected: false),
                                            FilterItem(title: "عنوان2", isSelected: false),
                                                 FilterItem(title: "عنوان کمی بزرگ", isSelected: false),
                                                 FilterItem(title: "عنوان بزرگ", isSelected: false),

                                            FilterItem(title: "1عنوان", isSelected: false)])

        let filter1 = SearchFilter(title: "Open", isSelected: false,
                                   filterItems: [FilterItem(title: "عنوان3", isSelected: false),
                                            FilterItem(title: "عنوان4", isSelected: false),
                                            FilterItem(title: "عنوان5", isSelected: false)])

        let filter3 = SearchFilter(title: "Star", isSelected: false,
                                   filterItems: [FilterItem(title: "عنوان", isSelected: false),
                                            FilterItem(title: "عنوان", isSelected: false),
                                            FilterItem(title: "عنوان", isSelected: false)])

        let filter2 = SearchFilter(title: "Vaccine", isSelected: false,
                                   filterItems: [FilterItem(title: "آسترازانکا", isSelected: false),
                                                 FilterItem(title: "سینوفارم", isSelected: true),
                                                 FilterItem(title: "بایوتک", isSelected: false),
                                                FilterItem(title: "فایزر", isSelected: true)])



        return [filter0,filter1,filter2,filter3]
    }

    func mockResultList() -> [SearchResponse]{

        let response0 = SearchResponse(title: "Dr Rajabalizade drog stor",
                                      subTitle: "Mashhad, Shahrak-e-Farhangyan, Vakil Abad Hwy",
                                      distanse: "1/2",
                                      distanseLabel: "Km", image: "stethoscope.circle.fill")

        let response1 = SearchResponse(title: "Dr Rajabalizade drog stor witout mahdi",
                                      subTitle: "Mashhad, Shahrak-e-Nofel Lowshatow, Kalantari Expy",
                                      distanse: "1/8",
                                      distanseLabel: "Km", image: "stethoscope.circle.fill")

        let response2 = SearchResponse(title: "Rahimi drog stor",
                                      subTitle: "Mashhad, Shahrak-e-Farhangyan, Vakil Abad Hwy",
                                      distanse: "2/4",
                                      distanseLabel: "Km", image: "stethoscope.circle.fill")

        let response3 = SearchResponse(title: "Rahimi drog stor",
                                      subTitle: "Mashhad, Shahrak-e-Nofel Lowshatow, Kalantari Expy",
                                      distanse: "3/2",
                                      distanseLabel: "Km", image: "stethoscope.circle.fill")

        let response4 = SearchResponse(title: "Safari drog stor",
                                      subTitle: "Mashhad, Shahrak-e-Farhangyan, Vakil Abad Hwy",
                                      distanse: "3/4",
                                      distanseLabel: "Km", image: "stethoscope.circle.fill")

        return [response0,response1,response2,response3,response4]
    }
}
