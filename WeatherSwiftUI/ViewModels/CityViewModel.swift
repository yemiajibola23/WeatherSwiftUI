//
//  CityViewModel.swift
//  WeatherSwiftUI
//
//  Created by Yemi Ajibola on 10/16/23.
//

import Foundation

@MainActor
final class CityViewModel: ObservableObject {
    @Published var lat: Double
    @Published var lon: Double
    
    @Published var weather: WeatherResponse?
    @Published var error: Error?
    @Published var isShowingError = false
    
    
    @Published var hourlyViewModels: [HourlyWeatherViewModel]
    @Published var dailyViewModels: [DailyDescriptionViewModel]
    @Published var weatherHeaderViewModel: WeatherHeaderViewModel

    
    var location: Location = Location(city: "Tokyo", country: "Japan")
    
    init(lat: Double, lon: Double, hourlyViewModels: [HourlyWeatherViewModel] = [], dailyViewModels: [DailyDescriptionViewModel] = [], weatherHeaderViewModel: WeatherHeaderViewModel = .mock) {
        self.lat = lat
        self.lon = lon
        self.hourlyViewModels = hourlyViewModels
        self.dailyViewModels = dailyViewModels
        self.weatherHeaderViewModel = weatherHeaderViewModel
    }
    
    func fetchWeather() async {
        do {
            weather = try await WeatherService.getWeatherData(lat: lat, lon: lon)
//            print(weather)
            hourlyViewModels = weather?.hourly.map { HourlyWeatherViewModel(hourly: $0) } ?? []
            dailyViewModels = weather?.daily.map { DailyDescriptionViewModel(daily: $0) } ?? []
            weatherHeaderViewModel = WeatherHeaderViewModel(city: "Tokyo", country: "Japan", icon: (weather?.current.weather.first)!.icon, condition: (weather?.current.weather.first)!.main, date: "Nov 13, 2022")
            location = await Location(lat: lat, lon: lon)
            
        } catch {
            print(error)
            self.error = error
            isShowingError = true
            
        }
       
    }
    
    static let mock = CityViewModel(lat: 10.99, lon: 44.34, hourlyViewModels: HourlyWeatherViewModel.multipleMocks, dailyViewModels: [.mock, .mock, .mock, .mock], weatherHeaderViewModel: .mock)
}
