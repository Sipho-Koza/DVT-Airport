//
//  ScheduleViewController.swift
//  DVT Airport
//
//  Created by Koza, Sipho (RBI-UK) on 18/06/2019.
//  Copyright © 2019 Koza, Sipho (RBI-UK). All rights reserved.
//

import Foundation
import UIKit

class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var retrievedSchedule = [ScheduleDataModel]()
    private var titleView: UIView!
    private var tableView: UITableView!
    
    private var airportNameLabel: UILabel!
    private var airportPlaceLabel: UILabel!
    private var ariportImageView: UIImageView!
    
    var airportName = String()
    var airportIataCode = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGray
        self.fetchSchedule()
        
//        self.setupUI()
//        self.setupTableView()
//
//        let hasImage: Bool = true
//        var avatar = UIImage()
//        avatar = UIImage(named: "Plane_x2")!
//
//        var departureStatusImage = UIImage()
//        departureStatusImage = UIImage(named: "green_dot_x2")!
//
//        if hasImage {
//            avatar = UIImage(named: "Plane_x1")!
//            departureStatusImage = UIImage(named: "green_dot_x1")!
//        }
//
//        let scheduleArray = NSMutableArray()
//        scheduleArray.add(ScheduleDataModel(departureTime: "06:05", departureStatusImage: departureStatusImage, departureStatus: "Boarding", avatar: avatar, flightName: "SOUTH AFRICAN AIRWAYS", flightDestination: "Cape Town", flightNumber: "SA303"))
//        scheduleArray.add(ScheduleDataModel(departureTime: "06:05", departureStatusImage: departureStatusImage, departureStatus: "Boarding", avatar: avatar, flightName: "BRITISH AIRWAYS", flightDestination: "Kempton Park", flightNumber: "SA303"))
//        scheduleArray.add(ScheduleDataModel(departureTime: "06:05", departureStatusImage: departureStatusImage, departureStatus: "Departed", avatar: avatar, flightName: "MANGO", flightDestination: "Bundu Inn", flightNumber: "SA303"))
        
//        for item in scheduleArray {
//            if let d = item as? ScheduleDataModel {
//
////                schedulesModel.append(ScheduleCellModel(departureTime: d.departureTime!, departureStatusImage: departureStatusImage, departureStatus: d.departureStatus!, avatar: avatar, flightName: d.flightName!, flightDestination: d.flightDestination!, flightNumber: d.flightNumber!, hasTitleImage: hasImage))
//            }
//        }
//        self.tableView.reloadData()
    }
    
    private func fetchSchedule () {
        
        if let IataCode = airportIataCode as String? {
            Webservice().load(resource: ScheduleDataModel.fetch(iataCode: IataCode)) { result in
                
                switch result {
                case .failure(let error):
                    UIAlertController.buildDismissAlertController(title: "Error", message: error.errorMessage)
                case .success(let timeTable):
                    DispatchQueue.main.async {
                        self.retrievedSchedule = timeTable
                        
                        print(self.retrievedSchedule[0].status!)
                        print(self.retrievedSchedule[0].type!)
                    }
                }
            }
        }
    }
    
    private func setupTableView () {

        let titleViewHeight: CGFloat = self.viewFrame.height/4
        let tableViewH: CGFloat = self.viewFrame.height - titleViewHeight
        self.tableView = UITableView(frame: CGRect(x: 0, y: titleViewHeight, width: self.viewFrame.width, height: tableViewH))
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(ScheduleCell.self, forCellReuseIdentifier: NSStringFromClass(ScheduleCell.self))
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor.groupTableViewBackground
        self.view.addSubview(self.tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
  
    private func setupUI() {
        
        let titleViewHeight: CGFloat = self.viewFrame.height/4
        self.titleView = UIView(frame: CGRect(x: 0, y: 0, width: self.viewFrame.width, height: titleViewHeight))
        self.titleView.backgroundColor = UIColor.yellow
        self.view.addSubview(self.titleView)
        
        self.ariportImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.viewFrame.width, height: titleViewHeight))
        self.ariportImageView.image = UIImage(named: "or_tambo")
        self.view.addSubview(self.ariportImageView)
        
        let headerViewFrame = self.titleView.frame
        
        self.airportPlaceLabel = UILabel(frame: CGRect(x: 20, y: headerViewFrame.height - (headerViewFrame.height/3), width: headerViewFrame.width - 40, height: 40))
        self.airportPlaceLabel.text = "Airport Kempton Park"
        self.airportPlaceLabel.font = UIFont.appCellTimeAndStatusFont
        self.airportPlaceLabel.textColor = UIColor.white
        self.view.addSubview(self.airportPlaceLabel)
        
        self.airportNameLabel = UILabel(frame: CGRect(x: 20, y: headerViewFrame.height - (headerViewFrame.height/2), width: headerViewFrame.width - 40, height: 40))
        self.airportNameLabel.text = airportName
        self.airportNameLabel.textColor = UIColor.white
        self.view.addSubview(self.airportNameLabel)
        
        
        
//        self.title = "Schedule"
        
//        let barHeight: CGFloat = self.viewFrame.height/6
//        self.navBar.frame = CGRect(x: 0, y: 0, width: self.viewFrame.width, height: barHeight)
//        self.navBar.backgroundColor = UIColor.yellow
//        self.view.addSubview(self.navBar)
    }
    
    //tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return retrievedSchedule.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat().cellHeight
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(ScheduleCell.self), for: indexPath) as! ScheduleCell

//        cell.scheduleCell = self.retrievedSchedule[indexPath.row]

        return cell
    }
}

extension UINavigationBar {
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 51)
    }
}
