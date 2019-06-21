//
//  Font+Extension.swift
//  DVT Airport
//
//  Created by Koza, Sipho (RBI-UK) on 18/06/2019.
//  Copyright © 2019 Koza, Sipho (RBI-UK). All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    //cellTimeAndStatus
    public class var appCellTimeAndStatusFont: UIFont {
        return UIFont.systemFont(ofSize: 11, weight: .semibold)
    }
    
    //appCellFlightNameFont
    public class var appCellFlightNameFont: UIFont {
        return UIFont.systemFont(ofSize: 13, weight: .semibold)
    }
    
    //
    public class var appScheduleTitleFont: UIFont {
        return UIFont.systemFont(ofSize: 17, weight: .bold)
    }
    
}
