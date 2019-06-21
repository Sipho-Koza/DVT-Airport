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
    private var scheduleCellModel: [ScheduleCellModel] = []
    private var titleView: UIView!
    private var tableView: UITableView!
    
    private var airportNameLabel: UILabel!
    private var airportPlaceLabel: UILabel!
    
    private var backButton: UIButton!
    
    var airportName = String()
    var airportIataCode = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGray

        self.setupUI()
        self.setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if Reachability.isConnectedToNetwork() {
            self.fetchSchedule()
        } else {
            UIAlertController.buildNetworkErrorAlertController()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
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
                        for item in self.retrievedSchedule {
                            self.scheduleCellModel.append(ScheduleCellModel(scheduleDataModel: item))
                        }
                        self.tableView.reloadData()
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
    
    private func setupUI() {
        
        let titleViewHeight: CGFloat = self.viewFrame.height/4
        self.titleView = UIView(frame: CGRect(x: 0, y: 0, width: self.viewFrame.width, height: titleViewHeight))
        self.titleView.backgroundColor = UIColor.white
        self.view.addSubview(self.titleView)
        
        let headerViewFrame = self.titleView.frame
        let x: CGFloat = 20
        self.airportNameLabel = UILabel(frame: CGRect(x: x, y: headerViewFrame.height/2, width: headerViewFrame.width - 40, height: 40))
        self.airportNameLabel.text = airportName
        self.airportNameLabel.textColor = UIColor.darkGray
        self.airportNameLabel.font = UIFont.appScheduleTitleFont
        self.airportNameLabel.textAlignment = .center
        self.view.addSubview(self.airportNameLabel)
        
        self.airportPlaceLabel = UILabel(frame: CGRect(x: x, y: headerViewFrame.height - (headerViewFrame.height/3), width: headerViewFrame.width - 40, height: 40))
        self.airportPlaceLabel.text = "Airport"
        self.airportPlaceLabel.font = UIFont.appCellTimeAndStatusFont
        self.airportPlaceLabel.textColor = UIColor.darkGray
        self.airportPlaceLabel.textAlignment = .center
        self.view.addSubview(self.airportPlaceLabel)
        
        self.backButton = UIButton(frame: CGRect(x: x, y: x, width: 40, height: 40))
        self.backButton.setBackgroundImage(UIImage(named: "backIcon90"), for: [])
        self.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        self.view.addSubview(self.backButton)
    }
    
    //MARK: IBAction
    @objc func backButtonTapped() {

        self.dismiss(animated: true, completion: nil)
    }
    
    //tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleCellModel.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat().cellHeight
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(ScheduleCell.self), for: indexPath) as! ScheduleCell
        cell.scheduleCell = self.scheduleCellModel[indexPath.row]
        return cell
    }
}

extension UINavigationBar {
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 51)
    }
}
