//
//  AirportViewModel.swift
//  DVT Airport
//
//  Created by Koza, Sipho (RBI-UK) on 20/06/2019.
//  Copyright © 2019 Koza, Sipho (RBI-UK). All rights reserved.
//

import Foundation
import UIKit

extension AirportModel {
    static func fetch (lat: Double, lng:Double) -> Resource<[AirportModel]> {
        
//        https://aviation-edge.com/v2/public/nearby?key=d1d5ad-cb2daf&lat=-26.147655&lng=28.0518967&distance=100
        let urlString = String("\(Client.basePath.rawValue)nearby?key=\(Client.apiKey.rawValue)&lat=\(lat)&lng=\(lng)&distance=100")
        guard let url = URL(string: urlString) else {
            fatalError("Something is wrong with the url")
        }
     
        let resource = Resource<[AirportModel]>(url: url)
        return resource
    }
}
