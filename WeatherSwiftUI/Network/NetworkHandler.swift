//
//  NetworkHandler.swift
//  WeatherSwiftUI
//
//  Created by Yemi Ajibola on 10/12/23.
//

import Foundation

class NetworkHandler {
    // Generic Network Request Handler
    // params: APIRequest
    func handle<T: Decodable>(request: APIRequest) async throws -> T {
        do {
            let networkRequest = NetworkRequest(apiRequest: request)
            let (data, response) = try await URLSession.shared.data(for: networkRequest.request)
            
            guard let response = response as? HTTPURLResponse else { throw NetworkLayerError.httpError }
            
            if response.statusCode == 200 {
                do {
                    return try JSONDecoder().decode(T.self, from: data)
                } catch let DecodingError.dataCorrupted(context) {
                    throw NetworkLayerError.corruptedData(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    throw NetworkLayerError.keyNotFound(key, context)
                } catch let DecodingError.valueNotFound(value, context) {
                    throw NetworkLayerError.valueNotFound(value, context)
                } catch let DecodingError.typeMismatch(type, context)  {
                    throw NetworkLayerError.typeMismatch(type, context)
                }
                
            } else {
                throw NetworkLayerError.statusError(response.statusCode)
            }
        } catch let error as NetworkLayerError {
            print(error)
            throw error
        } catch {
            throw NetworkLayerError.general(error)
        }
    }
}
