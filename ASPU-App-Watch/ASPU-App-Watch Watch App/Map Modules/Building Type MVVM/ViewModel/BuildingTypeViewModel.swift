//
//  BuildingTypeViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 09.08.2024.
//

import MapKit
import SwiftUI

final class BuildingTypeViewModel: ObservableObject {
    
    @Published var selected: Int?
    @Published var buildings = [BuildingModel]()
    @Published var currentLocation = Buildings.pins[0]
    @Published var camera: MapCameraPosition = .automatic
    @Published var isPresented = false
    @Published var isPresentedOptions = false
    
    // MARK: - сервисы
    private let locationManager = LocationManager()
    
    func indexOfBuilding(building: BuildingModel)-> Int {
        return buildings.firstIndex { $0.name == building.name} ?? 0
    }
    
    func setUpData(buildings: [BuildingModel]) {
        self.buildings = []
        self.buildings = buildings
        getLocation()
    }
    
    func getLocation() {
        locationManager.checkLocationAuthorization { isAuth in
            if isAuth {
                self.locationManager.getLocations()
                self.locationManager.registerLocationHandler { location in
                    self.camera = .region(MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 200, longitudinalMeters: 200))
                }
            }
        }
    }
    
    func indexOfUserLocation()-> Int {
        return buildings.firstIndex { $0.name == "Вы" } ?? 0
    }
}
