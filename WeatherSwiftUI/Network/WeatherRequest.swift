//
//  WeatherRequest.swift
//  WeatherSwiftUI
//
//  Created by Yemi Ajibola on 10/10/23.
//

import Foundation

enum WeatherRequest {
    case current(Double, Double)
    case oneCall(Double, Double)
}

extension WeatherRequest: APIRequest {
    var path: String {
        switch self {
        case .current:
            return "weather"
        case .oneCall:
            return "onecall"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .current:
            return .get
        case .oneCall:
            return .get
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .current(let lat, let long):
            return [
                URLQueryItem(name: "lat", value: "\(lat)"),
                URLQueryItem(name: "lon", value: "\(long)"),
                URLQueryItem(name: "appid", value: Constants.apiKey)
            ]
            
        case .oneCall(let lat, let long):
            return [
                URLQueryItem(name: "lat", value: "\(lat)"),
                URLQueryItem(name: "lon", value: "\(long)"),
                URLQueryItem(name: "appid", value: Constants.apiKey)
            ]
        }
        
    }
    
}
