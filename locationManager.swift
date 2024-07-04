//
//  locationManager.swift
//  BlueScan
//
//  Created by Minh on 21/06/2024.
//

// POUR LA GEOLOCALISATION - A VOIR SI UTILISE

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    @Published var degrees: Double = 0
    
    override init() {
        super.init()
        manager.delegate = self
        manager.startUpdatingHeading()
        manager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        degrees = newHeading.trueHeading
    }
}
