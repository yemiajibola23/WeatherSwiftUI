//
//  WeatherHeaderViewModel.swift
//  WeatherSwiftUI
//
//  Created by Yemi Ajibola on 11/14/23.
//

import Foundation


class WeatherHeaderViewModel: ObservableObject {
    @Published var city: String
    @Published var country: String
    @Published var icon: URL
    @Published var condition: String
    @Published var date: String
    
    init(city: String, country: String, icon: String, condition: String, date: String) {
        self.city = city
        self.country = country
        self.icon = URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")!
        self.condition = condition
        self.date = date
    }
    
    static let mock = WeatherHeaderViewModel(city: "New York", country: "USA", icon: "10d", condition: "Rainy", date: "Sat. 14 Nov 2023")
}
