//
//  TimeTable.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 05.07.2024.
//

import Foundation

struct TimeTable: Codable {
    
    let id, date: String
    var disciplines: [Discipline]
    
    enum CodingKeys: String, CodingKey {
        case id
        case date = "date"
        case disciplines = "disciplines"
    }
}
