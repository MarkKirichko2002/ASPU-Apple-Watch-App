//
//  NewsOptionModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 06.07.2024.
//

import Foundation

struct NewsOptionModel: Identifiable {
    let id: Int
    var name: String
    let icon: String
}

struct NewsOptions {
    
    static let options = [
        NewsOptionModel(id: 1, name: "...", icon: "mail"),
        NewsOptionModel(id: 2, name: "Страниц: ...", icon: "hashtag"),
        NewsOptionModel(id: 3, name: "Избранное", icon: "star"),
        NewsOptionModel(id: 4, name: "Фильтр", icon: "filter"),
    ]
}
