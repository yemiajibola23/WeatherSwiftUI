//
//  DailyDescriptionViewModel.swift
//  WeatherSwiftUI
//
//  Created by Yemi Ajibola on 10/21/23.
//

import Foundation

final class DailyDescriptionViewModel: ObservableObject, Identifiable {
    var id: UUID
    
    @Published var day: String = "Sun"
    @Published var temp: String = ""
    @Published var icon: URL
    @Published var condition: String
    
    init(id: UUID = UUID(), day: Int, temp: Double, icon: String, condition: String) {
        self.id = id
        self.icon = URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")!
        self.condition = condition
        self.day = dayOfWeek(from: day)
        self.temp = convert(temp: temp)
    }
    
    convenience init(daily: Daily) {
        self.init(day: daily.dt, temp: daily.temp.day, icon: daily.weather.first!.icon, condition: daily.weather.first!.main)
       
    }
    
    func dayOfWeek(from date: Int) -> String {
        let timeResult = Double(date)
        let date = Date(timeIntervalSince1970: timeResult)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        
        return dateFormatter.string(from: date)
        
    }
    
    func convert(temp: Double) -> String {
        var farenheit = 1.8*(temp-273) + 32
        return String(format: "%.0f°F", farenheit)
    }
    
    static let mock = DailyDescriptionViewModel(day: 1234, temp: 58, icon: "10d", condition: "Foggy")
}
