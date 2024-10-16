//
//  MapsInfoViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 16.09.2024.
//

import MapKit

final class MapsInfoViewModel: ObservableObject {
    
    @Published var info = ["Загрузка...", "вычисляем"]
    @Published var text = "Вычисляем..."
    @Published var isAlert = false
    @Published var currentBuidling = Buildings.pins[0]
    @Published var isPresented = false
    
    // MARK: - сервисы
    private let locationManager = LocationManager()
    private let settingsManager = SettingsManager()
    
    func checkLocationAuthorizationStatus() {
        locationManager.checkLocationAuthorization { isAuthorized in
            if isAuthorized {
                self.getLocation()
            } else {
                DispatchQueue.main.async {
                    self.isAlert.toggle()
                }
            }
        }
    }
    
    func getLocation() {
        
        locationManager.isUpdates = true
        locationManager.getLocations()
        
        locationManager.registerLocationHandler { location in
            let data = self.getInfo(currentLocation: location)
            self.info = [data.0, data.1]
        }
    }
    
    func getInfo(currentLocation: CLLocation)-> (String, String) {
        let savedDistance = settingsManager.getDistanceForBuilding()
        for i in Buildings.pins {
            let userLocation = CLLocation(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)
            let corpsLocation = CLLocation(latitude: i.pin.latitude, longitude:  i.pin.longitude)
            let distance = userLocation.distance(from: corpsLocation)
            let kilometers = Int(distance) / 1000
            let metres = Int(distance.truncatingRemainder(dividingBy: 1000))
            
            if (kilometers == 0 && metres <= savedDistance) {
                text = "Близко"
                currentBuidling = i
                return ("\"\(convertText(text: i.name))\"", "\(kilometers) км \(metres) м")
            } else {
                text = "Не найдено"
            }
        }
        return ("Нет близкого", "")
    }
    
    func convertText(text: String)-> String {
        if text == "Корпус и Общежитие №1" {
            return "Корпус и Общ. №1"
        }
        return text
    }
}
