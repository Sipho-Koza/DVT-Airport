//
//  Color+Extension.swift
//  DVT Airport
//
//  Created by Koza, Sipho (RBI-UK) on 18/06/2019.
//  Copyright © 2019 Koza, Sipho (RBI-UK). All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    //cellHeadlineFont
    public class var appBlueColor: UIColor {
        return UIColor(displayP3Red: 14.0/255, green: 122.0/255, blue: 254.0/255, alpha: 1.0)
    }
    
    public class var appDarkBlueColor: UIColor {
        return UIColor(displayP3Red: 22.0/255, green: 58.0/255, blue: 134.0/255, alpha: 1.0)
    }
    
    public class var appDarkGrayColor: UIColor {
        return UIColor.darkGray
    }
    
    public class var appLightGrayColor: UIColor {
        return UIColor.lightGray
    }
}
