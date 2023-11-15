//
//  WeatherService.swift
//  WeatherSwiftUI
//
//  Created by Yemi Ajibola on 10/16/23.
//

import Foundation


struct WeatherService {
    static func getWeatherData(lat: Double, lon: Double) async throws -> WeatherResponse {
        let networkHandler = NetworkHandler()
        let request = WeatherRequest.oneCall(lat, lon)
        
        return try await networkHandler.handle(request: request)
        
    }
}
