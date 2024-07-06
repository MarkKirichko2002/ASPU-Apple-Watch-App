//
//  LocationManager.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 06.07.2024.
//

import CoreLocation

class LocationManager: NSObject {
    
    var manager = CLLocationManager()
    
    var locationHandler: ((CLLocation)->Void)?
    
    func registerLocationHandler(block: @escaping(CLLocation)->Void) {
        self.locationHandler = block
    }
    
    func getLocations() {
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func checkLocationAuthorization(completion: @escaping (Bool) -> Void) {
        let status = CLLocationManager.authorizationStatus()
        if status == .notDetermined {
            manager.requestWhenInUseAuthorization()
            completion(true)
        } else if status == .restricted || status == .denied {
            completion(false)
        } else if status == .authorizedWhenInUse || status == .authorizedAlways {
            completion(true)
        }
    }
}

// MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.stopUpdatingLocation()
            locationHandler?(location)
        }
    }
}
