//
//  HomeViewModel.swift
//  WeatherSwiftUI
//
//  Created by Yemi Ajibola on 10/13/23.
//

import Foundation


final class Week7DayViewModel: ObservableObject {
    @Published var locations: [Location]
    
    init(locations: [Location] = Location.mock) {
        self.locations = locations
    }
}
