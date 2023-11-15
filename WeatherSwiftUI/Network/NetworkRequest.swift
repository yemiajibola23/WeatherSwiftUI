//
//  NetworkRequest.swift
//  WeatherSwiftUI
//
//  Created by Yemi Ajibola on 10/10/23.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol APIRequest {
    var url: String? { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem]? { get }
    var params: Any? { get }
    var timeoutInterval: TimeInterval { get }
}

extension APIRequest {
    var url: String? { nil }
    var queryItems: [URLQueryItem]? { [] }
    var params: Any? { nil }
    var timeoutInterval: TimeInterval { 10.0 }
}

struct NetworkRequest {
    var request: URLRequest
    
    init(apiRequest: APIRequest) {
        var urlcomponents = URLComponents(string: apiRequest.url?.description ?? Constants.baseURL) // if there is nothing inside api.url than send me the base url
        
        let path = urlcomponents?.path.appending(apiRequest.path) ?? ""
        
        urlcomponents?.path = path
        
        if let queryItem = apiRequest.queryItems {
            urlcomponents?.queryItems =  queryItem
        }
        guard let fullUrl = urlcomponents?.url else {
            assertionFailure("Did not load the url")
            request = URLRequest(url: URL(string: "")!)
            return
        }
        print(fullUrl)
        request = URLRequest(url: fullUrl)
        request.httpMethod = apiRequest.method.rawValue
        request.timeoutInterval = apiRequest.timeoutInterval
    }
}
