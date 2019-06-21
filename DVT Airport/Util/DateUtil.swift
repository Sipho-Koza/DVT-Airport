//
//  Date+Extension.swift
//  DVT Airport
//
//  Created by Koza, Sipho (RBI-UK) on 21/06/2019.
//  Copyright © 2019 Koza, Sipho (RBI-UK). All rights reserved.
//

import Foundation
import UIKit

class DateUtil {
    
    class func retrieveTimeFromDate (originalStringDate: String) -> String {
        
        let originalDate = convertDateFromStringToDate(strDate: originalStringDate)
        let calendar = Calendar.current
        
        var hour = String(calendar.component(.hour, from: originalDate))
        if hour.count == 1 {
            hour = "0\(hour)"
        }
        
        var minutes = String(calendar.component(.minute, from: originalDate))
        if minutes.count == 1 {
            minutes = "0\(minutes)"
        }
        
        return "\(hour):\(minutes)"
    }
    
    class func convertDateFromStringToDate(strDate: String) -> Date {
        
        let formatters = [
            "yyyy-MM-dd'T'HH:mm:ssZZZZZ",
            "yyyy-MM-dd",
            "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ",
            "yyyy-MM-dd'T'HH:mm:ss'Z'",
            "yyyy-MM-DD'T'hh:mm:ss'Z'",
            "yyyy-MM-dd'T'HH:mm:ss.SSS",
            "yyyy-MM-dd HH:mm:ss",
            "dd MMM yyyy",
            "dd MMM yyyy HH:mm",
            "dd MMM yyyy - HH:mm",
            "DD MMM YYYY",
            "DD/MM/YYYY'T'HH:mm:ss'Z'",
            "dd/MM/yyyy'T'HH:mm:ss'Z'",
            "dd/MM/YYYY'T'HH:mm:ss'Z'",
            "dd/M/yyyy'T'HH:mm:ss'Z'",
            "dd/MM/yyyyHH:mm:ss",
            "dd/MM/yyyyTHH:mm:ssZ",
            ].map { (format: String) -> DateFormatter in
                let formatter = DateFormatter()
                formatter.dateFormat = format
                return formatter
        }
        
        for formatter in formatters {
            if let date = formatter.date(from: strDate) {
                return date
            }
        }
        return Date()
    }
}
