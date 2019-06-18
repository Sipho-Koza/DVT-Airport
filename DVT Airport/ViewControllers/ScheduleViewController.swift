//
//  ScheduleViewController.swift
//  DVT Airport
//
//  Created by Koza, Sipho (RBI-UK) on 18/06/2019.
//  Copyright © 2019 Koza, Sipho (RBI-UK). All rights reserved.
//

import Foundation
import UIKit

struct scheduleData {
    
    var departureTime: String?
//    var departureStatusImage: UIImage?
    var departureStatus: String?
//    var avatar: UIImage?
    var flightName: String?
    var flightDestination: String?
    var number: String?
}

class ScheduleViewController: UIViewController {
    
    private var schedulesModel: [ScheduleCellModel] = []
    let cellReusableIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        
//        let imageView = UIImageView()
//        NSLayoutConstraint.activate([
//            imageView.heightAnchor.constraint(equalToConstant: 70),
//            imageView.widthAnchor.constraint(equalToConstant: 20)
//            ])
//        imageView.backgroundColor = .red
//
//        let titleLabel = UILabel()
//        titleLabel.text = "Custom title"
//
//        let hStack = UIStackView(arrangedSubviews: [imageView, titleLabel])
//        hStack.spacing = 5
//        hStack.alignment = .center
//
//        navigationItem.titleView = hStack
        
        
        
//        self.setupTableView()
        self.view.backgroundColor = UIColor.lightGray
        
        let sh = NSMutableArray()
        
        sh.add(scheduleData(departureTime: "06:05", departureStatus: "Boarding", flightName: "SOUTH AFRICAN AIRWAYS", flightDestination: "Cape Town", number: "SA303"))
        sh.add(scheduleData(departureTime: "05:09", departureStatus: "Departed", flightName: "SOUTH AFRICAN AIRWAYS", flightDestination: "Cape Town", number: "SA303"))
        sh.add(scheduleData(departureTime: "07:34", departureStatus: "Boarding", flightName: "SOUTH AFRICAN AIRWAYS", flightDestination: "Cape Town", number: "SA303"))
        
        
        for item in sh {
            if let d = item as? scheduleData {
                
                let avatar = UIImage(named: "Plane_x")
                let departureStatusImage = UIImage(named: "green_dot_x")
                
                schedulesModel.append(ScheduleCellModel(departureTime: d.departureTime!, departureStatusImage: departureStatusImage!, departureStatus: d.departureStatus!, avatar: avatar!, flightName: d.flightName!, flightDestination: d.flightDestination!, number: d.number!))
            }
        }
    }
    
//    private func setupTableView () {
//
//        self.tableView = UITableView(frame: self.view.bounds)
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
//        self.tableView.register(ScheduleCell.self, forCellReuseIdentifier: NSStringFromClass(ScheduleCell.self))
//        self.tableView.separatorStyle = .none
//        self.tableView.backgroundColor = UIColor.groupTableViewBackground
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
//        self.setupUI()
    }
    
    private func setupUI() {
        self.navigationItem.title = "Schedule"
        
        let height: CGFloat = self.viewFrame.height / 3
        let width = self.navigationController?.navigationBar.bounds.width
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: width!, height: height))
        self.navigationController?.navigationItem.titleView?.frame = CGRect(x: 0, y: 0, width: width!, height: height)
    }

    //tableView
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return schedulesModel.count
//    }
//
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return CGFloat().cellHeight
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = self.tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(ScheduleCell.self), for: indexPath) as! ScheduleCell
//
//        cell.scheduleCell = self.schedulesModel[indexPath.row]
//
//        return cell
//    }
}

