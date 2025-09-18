//
//  LocationManager.swift
//  FinancialHoldingTask
//
//  Created by Aya Mashaly on 18/09/2025.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    
    @Published var currentLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func startUpdating() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func stopUpdating() {
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        currentLocation = location.coordinate
    }
}
