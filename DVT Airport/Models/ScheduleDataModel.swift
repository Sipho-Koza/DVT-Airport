//
//  ScheduleDataModel.swift
//  DVT Airport
//
//  Created by Koza, Sipho (RBI-UK) on 19/06/2019.
//  Copyright © 2019 Koza, Sipho (RBI-UK). All rights reserved.
//

import Foundation
import UIKit

enum Status {
    case landed
    case active
    case scheduled
}

struct ScheduleDataModel: Codable {

    var type: String?
    var status: String?
    
//    var departureTime: String?
//    var departureStatusImage: UIImage?
//    var departureStatus: String?
//    var avatar: UIImage?
//    var flightName: String?
//    var flightDestination: String?
//    var flightNumber: String?
}

extension ScheduleCellModel {
    
    func displayAirportSchedule(_ airportSchedule: ScheduleDataModel) {
        
        
        
        
    }
}
