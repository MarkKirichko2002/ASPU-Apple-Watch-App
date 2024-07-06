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
}

struct NewsOptions {
    
    static let options = [
        NewsOptionModel(id: 1, name: "Категории"),
        NewsOptionModel(id: 2, name: "Страницы"),
    ]
}
