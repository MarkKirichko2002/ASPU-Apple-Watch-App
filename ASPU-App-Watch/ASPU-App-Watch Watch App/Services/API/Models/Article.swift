//
//  Article.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 05.07.2024.
//

import Foundation

struct Article: Identifiable, Codable {
    let id: Int
    let title: String
    let description: String?
    let date: String
    let previewImage: String
}

