//
//  BuildingType.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 08.08.2024.
//

import Foundation

enum BuildingType {
    case all
    case building
    case hostel
    case buildingAndHostel
}

struct BuildingTypeModel: Identifiable {
    let id: Int
    let name: String
    let type: BuildingType
    var count: Int
}

struct BuildingTypes {
    
    static var types = [
        BuildingTypeModel(id: 1, name: "Все здания", type: BuildingType.all, count: 0),
        BuildingTypeModel(id: 2, name: "Корпуса", type: BuildingType.building, count: 0),
        BuildingTypeModel(id: 3, name: "Общежития", type: BuildingType.hostel, count: 0),
    ]
}
