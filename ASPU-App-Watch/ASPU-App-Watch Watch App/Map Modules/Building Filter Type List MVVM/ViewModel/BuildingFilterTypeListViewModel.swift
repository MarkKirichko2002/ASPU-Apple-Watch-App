//
//  BuildingFilterTypeListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 08.08.2024.
//

import Foundation

final class BuildingFilterTypeListViewModel: ObservableObject {
    
    @Published var types = BuildingTypes.types
    @Published var isPresented = false
    var buildings = [BuildingModel]()
    
    func getInfo(buildings: [BuildingModel]) {
        types[0].count = buildings.count - 1
        types[1].count = buildings.filter({ $0.type == .building || $0.type == .buildingAndHostel}).count
        types[2].count = buildings.filter({ $0.type == .hostel || $0.type == .buildingAndHostel}).count
        self.buildings = buildings
    }
    
    func filterBuildings(type: BuildingTypeModel)-> [BuildingModel] {
        switch type.id {
        case 1:
            return buildings
        case 2:
            return buildings.filter({ $0.type == .building || $0.type == .buildingAndHostel || $0.type == .all})
        case 3:
            return buildings.filter({ $0.type == .hostel || $0.type == .buildingAndHostel || $0.type == .all})
        default:
            return buildings
        }
    }
}
