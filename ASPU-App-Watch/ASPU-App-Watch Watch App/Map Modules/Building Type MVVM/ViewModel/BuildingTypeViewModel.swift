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
    
    var index = 0
    
    // MARK: - сервисы
    private let locationManager = LocationManager()
    private let settingsManager = SettingsManager()
    
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
    
    func nextLocation()  {
        if index < buildings.count - 1 {
            index += 1
            let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
            let region = MKCoordinateRegion(center: buildings[index].pin, span: span)
            self.camera = .region(region)
        }
    }
    
    func pastLocation() {
        if index > 0 {
            index -= 1
            let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
            let region = MKCoordinateRegion(center: buildings[index].pin, span: span)
            self.camera = .region(region)
        }
    }
    
    func checkNavigationBar()-> Bool {
        return settingsManager.getNavigationBarOption()
    }
    
    func indexOfUserLocation()-> Int {
        return buildings.firstIndex { $0.name == "Вы" } ?? 0
    }
    
    func getArrowColor()-> AppColors {
        return settingsManager.getArrowsColor()
    }
    
    func getBuildingID(building: BuildingModel)-> Int {
        return buildings.firstIndex { $0.name == building.name } ?? 0
    }
}
