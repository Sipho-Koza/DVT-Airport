//
//  UIWindow+Extension.swift
//  DVT Airport
//
//  Created by Koza, Sipho (RBI-UK) on 20/06/2019.
//  Copyright © 2019 Koza, Sipho (RBI-UK). All rights reserved.
//

import Foundation
import UIKit

extension UIWindow {
    
    static func buildAlertController(alertController: UIAlertController) {
        self.topwindow().rootViewController?.present(alertController, animated: true, completion: nil)
    }

    static func topwindow () -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIViewController()
        window.windowLevel = UIWindow.Level.alert + 1
        window.makeKeyAndVisible()
        
        return window
    }
}
