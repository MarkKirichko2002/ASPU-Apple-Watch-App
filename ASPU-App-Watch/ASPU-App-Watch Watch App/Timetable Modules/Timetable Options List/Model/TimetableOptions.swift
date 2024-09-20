//
//  TimetableOptions.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 17.07.2024.
//

import Foundation

struct TimetableOptionModel: Identifiable {
    let id: Int
    let name: String
    let icon: String
}

struct TimetableOptions {
    
    static let options = [
        TimetableOptionModel(id: 1, name: "Группы", icon: "group"),
        TimetableOptionModel(id: 2, name: "Препод.", icon: "teacher"),
        TimetableOptionModel(id: 3, name: "Аудитории", icon: "door"),
        TimetableOptionModel(id: 4, name: "Недели", icon: "calendar"),
        TimetableOptionModel(id: 5, name: "Фильтрация", icon: "filter")
    ]
}
