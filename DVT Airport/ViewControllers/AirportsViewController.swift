//
//  AirportsViewController.swift
//  DVT Airport
//
//  Created by Koza, Sipho (RBI-UK) on 18/06/2019.
//  Copyright © 2019 Koza, Sipho (RBI-UK). All rights reserved.
//

import Foundation
import UIKit

class AirportsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.setupUI()
    }
    
    private func setupUI() {
        
        
        
    }
    
    @objc func takeMeToDestination() {
        
        let scheduleVC = ScheduleViewController()
        self.present(scheduleVC, animated: true, completion: nil)
        print("Button clicked...")
    }
}
