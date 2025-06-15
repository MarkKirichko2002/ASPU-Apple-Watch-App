//
//  BuildingsMapViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 06.07.2024.
//

import MapKit
import SwiftUI

final class BuildingsMapViewModel: ObservableObject {
    
    @Published var selected: Int?
    @Published var currentLocation = Buildings.pins[0]
    @Published var camera: MapCameraPosition = .automatic
    @Published var buildings = Buildings.pins
    @Published var isPresented = false
    @Published var isPresentedOptions = false
    @Published var alert = false
    
    var index = 0
    
    // MARK: - сервисы
    private let locationManager = LocationManager()
    private let settingsManager = SettingsManager()
    
    func getLocation() {
        locationManager.checkLocationAuthorization { isAuth in
            if isAuth {
                self.locationManager.getLocations()
                self.locationManager.registerLocationHandler { location in
                    self.camera = .region(MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 200, longitudinalMeters: 200))
                    if !self.buildings.contains(where: { $0.name == "Вы" }) {
                        self.buildings = []
                        self.buildings.append(BuildingModel(id: UUID(), name: "Вы", address: "", image: [], type: .all, audiences: [], pin: location.coordinate))
                        self.fillArray()
                    }
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
        } else {
            alert.toggle()
        }
    }
    
    func pastLocation() {
        if index > 0 {
            index -= 1
            let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
            let region = MKCoordinateRegion(center: buildings[index].pin, span: span)
            self.camera = .region(region)
        } else {
            alert.toggle()
        }
    }
    
    func checkNavigationBar()-> Bool {
        return settingsManager.getNavigationBarOption()
    }
    
    func fillArray() {
        for building in Buildings.pins {
            buildings.append(building)
        }
    }
    
    func getArrowColor()-> AppColors {
        return settingsManager.getArrowsColor()
    }
    
    func getBuildingID(building: BuildingModel)-> Int {
        return buildings.firstIndex { $0.name == building.name } ?? 0
    }
}
