//
//  ArticleModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 10.08.2024.
//

import SwiftData

@Model
class ArticleModel {
    var id: Int
    var title: String
    var desc: String
    var date: String
    var images: [String]
    
    init(id: Int, title: String, desc: String, date: String, images: [String]) {
        self.id = id
        self.title = title
        self.desc = desc
        self.date = date
        self.images = images
    }
}
