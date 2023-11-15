//
//  LocationManager.swift
//  WeatherSwiftUI
//
//  Created by Yemi Ajibola on 10/11/23.
//

import Foundation
import CoreLocation


class LocationManager: NSObject, ObservableObject {
    private let manager = CLLocationManager()
    @Published var isLoading = false
    @Published var location: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        manager.delegate = self
        requestLocatioh()
    }
    
    func requestLocatioh() {
        manager.requestWhenInUseAuthorization()
        isLoading = true
        manager.requestLocation()
    }
    
    func reverseGeocode(lat: Double, long: Double) async -> Location {
        guard let placemarks = try? await CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: lat, longitude: long)), let city = placemarks.first?.name, let country = placemarks.first?.country else {
            return Location.mock.first!
        }
        
        return Location(city: city, country: country)
    }
     
    func geocode(location: Location) async -> (Double, Double) {
        guard let placemarks = try? await CLGeocoder().geocodeAddressString("\(location.city), \(location.country)"), let lat = placemarks.first?.location?.coordinate.latitude, let long = placemarks.first?.location?.coordinate.longitude else {
            return (10.99, 44.34)
        }
        
        return (lat, long)
    }
        
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // TODO: - Handle error
        isLoading = false
        print("Error getting location: \(error.localizedDescription)")
    }
}
