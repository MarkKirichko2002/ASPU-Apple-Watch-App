//
//  TimetableOwners.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 17.07.2024.
//

import Foundation

struct TimetableOwnerModel: Identifiable {
    let id: Int
    let name: String
    let icon: String
}

struct TimetableOwners {
    
    static let owners = [
        TimetableOwnerModel(id: 1, name: "Группы", icon: "group"),
        TimetableOwnerModel(id: 2, name: "Препод.", icon: "teacher"),
        TimetableOwnerModel(id: 3, name: "Аудитории", icon: "door"),
        TimetableOwnerModel(id: 4, name: "Недели", icon: "calendar")
    ]
}
