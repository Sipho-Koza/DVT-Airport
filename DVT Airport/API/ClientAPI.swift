//
//  ClientAPI.swift
//  DVT Airport
//
//  Created by Koza, Sipho (RBI-UK) on 20/06/2019.
//  Copyright © 2019 Koza, Sipho (RBI-UK). All rights reserved.
//

import Foundation
import UIKit

//clientAPI details
enum Client: String, CaseIterable {
    case basePath = "https://aviation-edge.com/v2/public/"
    case contentType = "application/json"
    case apiKey = "d1d5ad-cb2daf"
    case distance = "100"
}

//https://aviation-edge.com/v2/public/nearby?key=d1d5ad-cb2daf&lat=-26.147655&lng=28.0518967&distance=100


extension Client {
    var displayName: String {
        get {
            switch self {
            case .basePath:
                return "BasePath"
            case .contentType:
                return "Content-Type"
            case .apiKey:
                return "API"
            case .distance:
                return "100"
            
            }
        }
    }
}


enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}


//network Error details
enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
    case networkError
    case unknownError
}

extension NetworkError {
    var errorMessage: String {
        get {
            switch self {
            case .decodingError:
                return "Could not decode the data recieved, please try again later."
            case .domainError:
                return "There is a problem with the domain, please try again later."
            case .urlError:
                return "Something is wrong with the url, please contact the administrator."
            case .networkError:
                return "No network connectivity, please make you have connected to wifi or cellular data."
            case .unknownError:
                return "Somethign went wrong, please try again later."
            }
        }
    }
}
