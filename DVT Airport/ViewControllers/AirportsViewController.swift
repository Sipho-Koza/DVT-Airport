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
        
        self.view.backgroundColor = UIColor.yellow
        
        let frame = UIScreen.main.bounds
        let navButton = UIButton(frame: CGRect(x: frame.width/2 - 50, y: frame.height/2, width: 100, height: 50))
        navButton.setTitle("Click Me!", for: [])
        navButton.setTitleColor(.black, for: [])
        navButton.addTarget(self, action: #selector(takeMeToDestination), for: .touchUpInside)
        self.view.addSubview(navButton)
        
        self.setupUI()
    }
    
    private func setupUI() {
        self.navigationItem.title = "DVT Airports"
    }
    
    @objc func takeMeToDestination() {
        
        let scheduleVC = ScheduleViewController()
//        scheduleVC.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: self.viewFrame.width, height: 200)
//        scheduleVC.navigationItem.title = "Tetsing title"
        self.navigationController?.pushViewController(scheduleVC, animated: true)
        print("Button clicked...")
    }
}
