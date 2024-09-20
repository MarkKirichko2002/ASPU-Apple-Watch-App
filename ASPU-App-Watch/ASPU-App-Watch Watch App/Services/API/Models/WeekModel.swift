//
//  WeekModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 26.07.2024.
//

import Foundation

struct WeekModel: Identifiable, Codable {
    let id: Int
    let from, to: String
    let dayNames: [String: String]
}
