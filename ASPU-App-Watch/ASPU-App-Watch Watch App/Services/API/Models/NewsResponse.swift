//
//  NewsResponse.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 05.07.2024.
//

import Foundation

struct NewsResponse: Codable {
    let currentPage, countPages: Int?
    var articles: [Article]?
}
