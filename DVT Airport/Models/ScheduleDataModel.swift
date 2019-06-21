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
    var airlineModel: AirlineModel?
    var arrivalModel: ArrivalModel?
    var departureModel: DepartureModel?
    var flightModel: FlightModel?
    
    private enum CodingKeys: String, CodingKey {
        case type
        case status
        case airlineModel = "airline"
        case arrivalModel = "arrival"
        case departureModel = "departure"
        case flightModel = "flight"
    }
}

struct AirlineModel: Codable {
    var iataCode: String?
    var icaoCode: String?
    var name: String?
}

struct ArrivalModel: Codable {
    var actualTime: String?
    var baggage: String?
    var estimatedTime: String?
    var iataCode: String?
    var icaoCode: String?
    var scheduledTime: String?
}

struct DepartureModel: Codable {
    var iataCode: String?
    var icaoCode: String?
    var scheduledTime: String?
}

struct FlightModel: Codable {
    var iataNumber: String?
    var icaoNumber: String?
    var number: String?
}

extension ScheduleCellModel {
    
    func displayAirportSchedule(_ airportSchedule: ScheduleDataModel) {
        
        
        
        
    }
}
