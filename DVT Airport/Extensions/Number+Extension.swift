//
//  Number+Extension.swift
//  DVT Airport
//
//  Created by Koza, Sipho (RBI-UK) on 18/06/2019.
//  Copyright © 2019 Koza, Sipho (RBI-UK). All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
    
    var cellHeight: CGFloat {
        return 170
    }
    
    var cellCornerRadius: CGFloat{
        return 20.0
    }
}

extension Double {
    //round the double to decimal place value
    func rounded(toPlaces places: Int) -> Double {
        let div = pow(10.0, Double(places))
        return (self*div).rounded()/div
    }
}
