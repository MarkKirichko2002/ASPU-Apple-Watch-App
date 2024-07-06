//
//  BuildingsMapViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 06.07.2024.
//

import MapKit
import SwiftUI

class BuildingsMapViewModel: ObservableObject {
    
    @Published var selected: Int?
    @Published var isPresented = false
    @Published var currentLocation = Buildings.pins[0]
    @Published var camera: MapCameraPosition = .automatic
    @Published var buildings = Buildings.pins
    
    // MARK: - сервисы
    private let locationManager = LocationManager()
    
    func indexOfBuilding(building: BuildingModel)-> Int {
        return buildings.firstIndex { $0.name == building.name} ?? 0
    }
    
    func getLocations() {
        locationManager.checkLocationAuthorization { isAuth in
            if isAuth {
                self.locationManager.getLocations()
                self.locationManager.registerLocationHandler { location in
                    self.camera = .region(MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 200, longitudinalMeters: 200))
                    if !self.buildings.contains(where: { $0.name == "Вы" }) {
                        self.buildings.append(BuildingModel(id: UUID(), name: "Вы", audiences: nil, pin: location.coordinate))
                    }
                }
            }
        }
    }
}
