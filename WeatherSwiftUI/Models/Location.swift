//
//  Location.swift
//  WeatherSwiftUI
//
//  Created by Yemi Ajibola on 10/13/23.
//

import Foundation

struct Location: Identifiable {
    var id = UUID()
    
    var city: String
    var country: String
    
    static let mock = [
        Location(city: "New York", country: "United States"),
        Location(city: "Tokyo", country: "Japan"),
        Location(city: "Paris", country: "France")
    ]
}
 
