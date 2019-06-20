//
//  AlertController+Extension.swift
//  DVT Airport
//
//  Created by Koza, Sipho (RBI-UK) on 20/06/2019.
//  Copyright © 2019 Koza, Sipho (RBI-UK). All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    
    static func buildDismissAlertController(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        UIWindow.buildAlertController(alertController: alert)
    }
    
    static func buildNetworkErrorAlertController () {
        let alert = UIAlertController(title: "Network Error", message: NetworkError.networkError.errorMessage, preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Settings", style: .destructive) { (action) in
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
        }
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alert.addAction(settingsAction)
        alert.addAction(dismissAction)
        
        UIWindow.buildAlertController(alertController: alert)
    }
}
