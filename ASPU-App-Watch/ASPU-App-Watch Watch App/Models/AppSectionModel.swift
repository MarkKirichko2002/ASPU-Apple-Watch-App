//
//  AppSectionModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 04.07.2024.
//

import Foundation

struct AppSectionModel: Codable, Identifiable, Hashable {
    let id: Int
    var isVisible: Bool
    let name: String
    let icon: String
}
