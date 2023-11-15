//
//  NetworkLayerError.swift
//  WeatherSwiftUI
//
//  Created by Yemi Ajibola on 10/12/23.
//

import Foundation

enum NetworkLayerError: Error, Equatable {
    case general(Error)
    case statusError(Int)
    case httpError
    case corruptedData(DecodingError.Context)
    case keyNotFound(CodingKey, DecodingError.Context)
    case valueNotFound(Any, DecodingError.Context)
    case typeMismatch(Any, DecodingError.Context)
    
    var title: String {
        switch self {
        case .general:
            return "An error occur"
        case .httpError:
            return "HTTP Error"
        case .statusError(let code):
            return "HttP Status \(code)"
        case .corruptedData:
            return "Corrupted Data"
        case .keyNotFound:
            return "Key not found"
        case .valueNotFound:
            return "Value not found"
        case .typeMismatch:
            return "Type Mismatch"
            
        }
    }
    
    var message: String? {
        switch self {
        case .general(let error):
            return error.localizedDescription
        case .httpError:
            return nil
        case .statusError:
            return nil
        case .corruptedData(let context):
            return  "\(context)"
        case .keyNotFound(let key, let context):
            return "\(key) was not found in \(context) when parsing JSON."
        case .valueNotFound(let value, let context):
            return "\(value) not found in \(context) when parsing JSON."
        case .typeMismatch(let type, let context):
            return "Type '\(type)' mismatch: \(context.debugDescription)\n codingPath:\( context.codingPath)"
        }
    }
}

extension NetworkLayerError {
    static func == (lhs: NetworkLayerError, rhs: NetworkLayerError) -> Bool {
        switch (lhs, rhs) {
        case (.statusError, .statusError),
            (.httpError, .httpError),
            (.corruptedData, .corruptedData),
            (.keyNotFound, .keyNotFound),
            (.valueNotFound, .valueNotFound),
            (.typeMismatch, .typeMismatch),
            (.general, .general):
            return true
        default:
            return false
        }
    }
}
