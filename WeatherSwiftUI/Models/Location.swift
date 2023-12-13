//
//  Location.swift
//  WeatherSwiftUI
//
//  Created by Yemi Ajibola on 10/13/23.
//

import Foundation
import CoreLocation

struct Location: Identifiable {
    var id = UUID()
    
    var city: String
    var country: String
    
    init(lat: Double, lon: Double) async {
        let loc = CLLocation(latitude: lat, longitude: lon)
        do {
            let placemark = try await CLGeocoder().reverseGeocodeLocation(loc).first!
            self.init(city: placemark.locality!, country: placemark.country!)
        } catch {
            print(error)
            self.init(city: "Tokyo", country: "Japan")
        }
       
        
    }
    
    init(city: String, country: String) {
        self.city = city
        self.country = country
    }
    
    static let mock = [
        Location(city: "New York", country: "United States"),
        Location(city: "Tokyo", country: "Japan"),
        Location(city: "Paris", country: "France")
    ]
}
 
