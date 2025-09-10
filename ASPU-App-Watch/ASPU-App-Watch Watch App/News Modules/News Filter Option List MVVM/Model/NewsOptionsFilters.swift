//
//  NewsOptionsFilters.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 18.10.2024.
//

import Foundation

enum NewsOptionsFilters {
    case today
    case yesterday
    case dayBeforeYesterday
    case currentWeek
    case all
}

struct FilterOptionModel: Identifiable {
    let id: Int
    let name: String
    let option: NewsOptionsFilters
    var count: Int
}

struct NewsFilters {
    
    static var options = [
        FilterOptionModel(id: 1, name: "Сегодня", option: NewsOptionsFilters.today, count: 0),
        FilterOptionModel(id: 2, name: "Вчера", option: NewsOptionsFilters.yesterday, count: 0),
        FilterOptionModel(id: 3, name: "Позавчера", option: NewsOptionsFilters.dayBeforeYesterday, count: 0),
        FilterOptionModel(id: 4, name: "Текущая неделя", option: NewsOptionsFilters.currentWeek, count: 0),
        FilterOptionModel(id: 5, name: "Все новости", option: NewsOptionsFilters.all, count: 0),
    ]
}
