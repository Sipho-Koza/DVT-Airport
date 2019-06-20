//
//  Webservice.swift
//  DVT Airport
//
//  Created by Koza, Sipho (RBI-UK) on 20/06/2019.
//  Copyright © 2019 Koza, Sipho (RBI-UK). All rights reserved.
//

import Foundation
import UIKit

struct Resource<T: Codable> {
    let url: URL
    var httpMethod: HTTPMethod = .get
    var body: Data? = nil
}

extension Resource {
    init(url: URL) {
        self.url = url
    }
}

class Webservice {
    
    func load<T>(resource: Resource<T>, completionHandler: @escaping (Result<T, NetworkError>) -> Void) {
        
        let request = Webservice.buildURLRequest(url: resource.url, httpMethod: .get)
        let urlSession = URLSession.shared
        urlSession.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                completionHandler(.failure(.domainError))
                return
            }
            
            let result = try? JSONDecoder().decode(T.self, from: data)
            if let result = result {
                DispatchQueue.main.async {
                    completionHandler(.success(result))
                }
            } else {
                completionHandler(.failure(.decodingError))
            }
        }.resume()
    }
    
    static private func buildURLRequest(url: URL = URL(string: "")!, httpMethod: HTTPMethod) -> URLRequest {
        
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = [Client.contentType.displayName: Client.contentType.rawValue]
        return urlRequest
    }
}
