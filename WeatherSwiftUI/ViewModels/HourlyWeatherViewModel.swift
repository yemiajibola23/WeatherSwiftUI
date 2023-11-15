//
//  HourlyWeatherViewModel.swift
//  WeatherSwiftUI
//
//  Created by Yemi Ajibola on 10/20/23.
//

import Foundation


final class HourlyWeatherViewModel: ObservableObject, Identifiable {
    var id: UUID
    
    @Published var time: String = ""
    @Published var icon: URL
    @Published var temperature: String
    
    
    static let mock = HourlyWeatherViewModel(time: 1234, icon: "10d", temperature: 58.00)
    static let multipleMocks = [mock, mock, mock]
    
    convenience init(hourly: Hourly) {
        self.init(time: hourly.dt, icon: hourly.weather.first!.icon, temperature: hourly.temp)
    }
    
    init(id: UUID = UUID(), time: Int, icon: String, temperature: Double) {
        self.id = id
        self.icon = URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")!
        self.temperature = "\(temperature)°"
        self.time = utcToLocal(dateStr: time)
    }
    
    func utcToLocal(dateStr: Int) -> String {
        let timeResult = Double(dateStr)
        let date = Date(timeIntervalSince1970: timeResult)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short //Set time style
        dateFormatter.dateStyle = DateFormatter.Style.none //Set date style
        dateFormatter.timeZone = .current
        
        
        return dateFormatter.string(from: date)
        
    }
}
