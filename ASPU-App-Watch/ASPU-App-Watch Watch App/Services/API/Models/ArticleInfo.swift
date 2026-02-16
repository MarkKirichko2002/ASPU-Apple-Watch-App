//
//  ArticleInfo.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 10.07.2024.
//

struct ArticleInfo: Codable {
    let id: Int?
    let title, description, date: String
    let images: [String]
}
