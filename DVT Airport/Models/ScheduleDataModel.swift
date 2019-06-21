//
//  ScheduleDataModel.swift
//  DVT Airport
//
//  Created by Koza, Sipho (RBI-UK) on 19/06/2019.
//  Copyright © 2019 Koza, Sipho (RBI-UK). All rights reserved.
//

import Foundation
import UIKit

enum Status: String {
    case landed = "landed"
    case active = "active"
    case scheduled = "scheduled"
}

extension Status {
    var description: String {
        get {
            switch self {
            case .landed:
                return "Departed"
            case .active:
                return "Boarding"
            case .scheduled:
                return "Boarding"
            }
        }
    }
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


//ScheduleCellModel
class ScheduleCellModel: NSObject {
    
    var departureTime: String?
    var departureStatusImage: UIImage? //???
    var departureStatus: String?
    var flightName: String?
    var flightDestination: String?
    var flightNumber: String?
    
    init (scheduleDataModel: ScheduleDataModel) {
        
        //time
        if let scheduleTime = scheduleDataModel.departureModel?.scheduledTime {
            departureTime = DateUtil.retrieveTimeFromDate(originalStringDate: scheduleTime)
        }
        
        //status
        if let status = scheduleDataModel.status {
            
            if status == Status.landed.rawValue {
                departureStatus = Status.landed.description
                departureStatusImage = UIImage(named: "Red_dot_x1")
            } else {
                departureStatus = Status.scheduled.description
                departureStatusImage = UIImage(named: "green_dot_x1")
            }
        }
        
        //airlineName
        if let airLineName = scheduleDataModel.airlineModel?.name {
            flightName = airLineName.uppercased()
        }
        
        //destination
        if let destinationPlace = scheduleDataModel.arrivalModel?.iataCode {
            flightDestination = destinationPlace
        }
        
        //flightNumber
        if let flightNum = scheduleDataModel.flightModel?.number {
            flightNumber = flightNum
        }
    }
}
