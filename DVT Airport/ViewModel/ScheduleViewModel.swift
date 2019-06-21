//
//  ScheduleViewModel.swift
//  DVT Airport
//
//  Created by Koza, Sipho (RBI-UK) on 20/06/2019.
//  Copyright © 2019 Koza, Sipho (RBI-UK). All rights reserved.
//

import Foundation
import UIKit

extension ScheduleDataModel {
    
    static func fetch (iataCode: String) -> Resource<[ScheduleDataModel]> {
        //https://aviation-edge.com/v2/public/timetable?key=d1d5ad-cb2daf&iataCode=ZZV&type=departure
        let urlString = String("\(Client.basePath.rawValue)timetable?key=\(Client.apiKey.rawValue)&iataCode=\(iataCode)&type=departure")
        guard let url = URL(string: urlString) else {
            fatalError("Something is wrong with the schedule url.")
        }
        let resource = Resource<[ScheduleDataModel]>(url: url)
        return resource
    }
}
