//
//  AirportModel.swift
//  DVT Airport
//
//  Created by Koza, Sipho (RBI-UK) on 19/06/2019.
//  Copyright © 2019 Koza, Sipho (RBI-UK). All rights reserved.
//

import Foundation
import UIKit

struct AirportModel: Codable {
    
    let airportId: String?
    let nameAirport: String?
    let codeIataAirport: String?
    let codeIcaoAirport: String?
    let latitudeAirport: String?
    let longitudeAirport: String?
    let geonameId: String?
    let timezone: String?
    let GMT: String?
    let phone: String?
    let nameCountry: String?
    let codeIso2Country: String?
    let codeIataCity: String?
    let distance: String?
    
}


//[
//    {
//        "airportId": "7",
//        "nameAirport": "Aachen/Merzbruck",
//        "codeIataAirport": "AAH",
//        "codeIcaoAirport": "EDKA",
//        "latitudeAirport": "50.75",
//        "longitudeAirport": "6.133333",
//        "geonameId": "3247449",
//        "timezone": "Europe/Berlin",
//        "GMT": "1", "phone": "",
//        "nameCountry": "Germany",
//        "codeIso2Country": "DE",
//        "codeIataCity": "AAH"
//    }
//]
