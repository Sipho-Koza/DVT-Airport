//
//  ScheduleCell.swift
//  DVT Airport
//
//  Created by Koza, Sipho (RBI-UK) on 18/06/2019.
//  Copyright © 2019 Koza, Sipho (RBI-UK). All rights reserved.
//

import Foundation
import UIKit

class ScheduleCellModel: NSObject {
    
    var departureTime: String?
    var departureStatusImage: UIImage?
    var departureStatus: String?
    var avatar: UIImage?
    var flightName: String?
    var flightDestination: String?
    var flightNumber: String?
    var hasTitleImage: Bool?
    
//    init (object: AnyObject) {
//
//    }
    
    
    init(departureTime: String, departureStatusImage: UIImage, departureStatus: String, avatar: UIImage ,flightName: String, flightDestination: String, flightNumber: String, hasTitleImage: Bool) {

        self.departureTime = departureTime
        self.departureStatusImage = departureStatusImage
        self.departureStatus = departureStatus
        self.avatar = avatar
        self.flightName = flightName
        self.flightDestination = flightDestination
        self.flightNumber = flightNumber
        self.hasTitleImage = hasTitleImage
    }
}

class ScheduleCell: UITableViewCell {
    
    var padding: CGFloat = 15
    let viewPadding: CGFloat = 10
    let leftX: CGFloat = 5
    
    var backgoundView: UIView!
    var seperatorLine: UIView!
    
    var departureTimeLabel: UILabel!
    var departureStatusImageView: UIImageView!
    var departureStatusLabel: UILabel!
    var avatarImageView: UIImageView!
    var flightNameLabel: UILabel!
    var flightDestinationLabel: UILabel!
    var numberLabel: UILabel!
    
    
    var deptTimeheaderLabel: UILabel!
    var flightNumberHeaderLabel: UILabel!
    var destinationHeaderLabel: UILabel!
    
    var hasTitleImg: Bool!
    
    var scheduleCell: ScheduleCellModel? {
        didSet {
            if let schdeule_cell = scheduleCell {
                backgoundView.backgroundColor = UIColor.white
                seperatorLine.backgroundColor = UIColor.lightGray
                
                departureTimeLabel.text = schdeule_cell.departureTime
                departureStatusImageView.image = schdeule_cell.departureStatusImage
                departureStatusLabel.text = schdeule_cell.departureStatus
                avatarImageView.image = schdeule_cell.avatar
                flightNameLabel.text = schdeule_cell.flightName
                flightDestinationLabel.text = schdeule_cell.flightDestination
                numberLabel.text = schdeule_cell.flightNumber
                hasTitleImg = schdeule_cell.hasTitleImage
                
                setNeedsLayout()
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        //background
        backgroundColor = UIColor.groupTableViewBackground
        
        backgoundView = UIView(frame: .zero)
        backgoundView.alpha = 0.6
        
        //seperatorLine
        seperatorLine = UIView(frame: .zero)
        seperatorLine.alpha = 0.6
        contentView.addSubview(seperatorLine)
        
        //departureTimeLabel
        departureTimeLabel = UILabel(frame: .zero)
        departureTimeLabel.textAlignment = .left
        departureTimeLabel.textColor = UIColor.appDarkBlueColor
        departureTimeLabel.font = UIFont.appCellTimeAndStatusFont
        contentView.addSubview(departureTimeLabel)
        
        //departureStatusImageView
        departureStatusImageView = UIImageView(frame: .zero)
        departureStatusImageView.sizeToFit()
        departureStatusImageView.layer.cornerRadius = 5
        contentView.addSubview(departureStatusImageView)
        
        //departureStatusLabel
        departureStatusLabel = UILabel(frame: .zero)
        departureStatusLabel.textAlignment = .right
        departureStatusLabel.textColor = UIColor.appDarkGrayColor
        departureStatusLabel.font = UIFont.appCellTimeAndStatusFont
        contentView.addSubview(departureStatusLabel)
        
        //avatarImageView
        avatarImageView = UIImageView(frame: .zero)
        avatarImageView.sizeToFit()
        avatarImageView.layer.cornerRadius = 5
        contentView.addSubview(avatarImageView)
        
        //airportNameLabel
        flightNameLabel = UILabel(frame: .zero)
        flightNameLabel.textAlignment = .left
        flightNameLabel.textColor = UIColor.appDarkBlueColor
        flightNameLabel.font = UIFont.appCellFlightNameFont
        contentView.addSubview(flightNameLabel)
        
        //flightDestinationLabel
        flightDestinationLabel = UILabel(frame: .zero)
        flightDestinationLabel.textAlignment = .left
        flightDestinationLabel.textColor = UIColor.appDarkBlueColor
        flightDestinationLabel.font = UIFont.appCellTimeAndStatusFont
        contentView.addSubview(flightDestinationLabel)
        
        //numberLabel
        numberLabel = UILabel(frame: .zero)
        numberLabel.textAlignment = .center
        numberLabel.textColor = UIColor.appDarkBlueColor
        numberLabel.font = UIFont.appCellTimeAndStatusFont
        contentView.addSubview(numberLabel)
        
//        if hasTitleImg != nil && hasTitleImg {
            self.setupComponentsHasTitleImage()
//        } else {
//            self.setupComponentsHasNoTitleImage()
//        }
    }
    
    private func setupComponentsHasTitleImage () {
        backgoundView.layer.cornerRadius = 0
        contentView.addSubview(backgoundView)
        
        deptTimeheaderLabel = UILabel(frame: .zero)
        deptTimeheaderLabel.textAlignment = .left
        deptTimeheaderLabel.textColor = .lightGray
        deptTimeheaderLabel.text = "Departure Time"
        deptTimeheaderLabel.font = UIFont.appCellTimeAndStatusFont
        contentView.addSubview(deptTimeheaderLabel)
        
        flightNumberHeaderLabel = UILabel(frame: .zero)
        flightNumberHeaderLabel.textAlignment = .center
        flightNumberHeaderLabel.textColor = .lightGray
        flightNumberHeaderLabel.text = "Flight Number"
        flightNumberHeaderLabel.font = UIFont.appCellTimeAndStatusFont
        contentView.addSubview(flightNumberHeaderLabel)
        
        destinationHeaderLabel = UILabel(frame: .zero)
        destinationHeaderLabel.textAlignment = .left
        destinationHeaderLabel.textColor = .lightGray
        destinationHeaderLabel.text = "Destination"
        destinationHeaderLabel.font = UIFont.appCellTimeAndStatusFont
        contentView.addSubview(destinationHeaderLabel)
    }
    
    private func setupComponentsHasNoTitleImage () {
        backgoundView.layer.cornerRadius = CGFloat().cellCornerRadius
        contentView.addSubview(backgoundView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        if hasTitleImg {
            self.setupFrameForHasTitleImage()
//        } else {
//            self.setupFrameForHasNoTitleImage()
//        }
    }
    
    private func setupFrameForHasTitleImage () {
        backgoundView.frame = CGRect(x: 0, y: 0, width: frame.width, height: CGFloat().cellHeight - 10)
        
        let _leftX: CGFloat = 20
        avatarImageView.frame = CGRect(x: _leftX, y: _leftX, width: frame.width/7, height: frame.width/7)
        
        //flightNameLabel
        let headerLeftX = avatarImageView.frame.width + _leftX
        let headerTitleWidth = (backgoundView.frame.width - headerLeftX) - (backgoundView.frame.width/3)
        flightNameLabel.frame = CGRect(x: headerLeftX, y: _leftX + (avatarImageView.frame.height/3), width: headerTitleWidth, height: avatarImageView.frame.height/3)
        
        //departureStatusLabel
        let destinationX = backgoundView.frame.width - (backgoundView.frame.width/4)
        let destinationW = (backgoundView.frame.width/5)
        departureStatusLabel.frame = CGRect(x: destinationX, y: _leftX + (avatarImageView.frame.height/3), width: destinationW, height: avatarImageView.frame.height/3)
        
        //departureStatusImageView
        departureStatusImageView.frame = CGRect(x: destinationX + 10, y: _leftX + (avatarImageView.frame.height/3) + ((avatarImageView.frame.height/3) / 3), width: 10, height: 10)
        
        //seperatorLine
        let sepY = _leftX + avatarImageView.frame.height + _leftX
        seperatorLine.frame = CGRect(x: _leftX, y: sepY, width: backgoundView.frame.width - _leftX , height: 0.5)
        
        //departureTimeLabel
        let deptTimeheaderY = (frame.height - sepY) + (_leftX/2)
        deptTimeheaderLabel.frame = CGRect(x: _leftX, y: deptTimeheaderY, width: backgoundView.frame.width/3, height: 50)
        departureTimeLabel.frame = CGRect(x: _leftX, y: deptTimeheaderY + 20 , width: backgoundView.frame.width/3, height: 50)
        
        //numberLabel
        let flightNumberHeaderX = (backgoundView.frame.width / 2)
        flightNumberHeaderLabel.frame = CGRect(x: flightNumberHeaderX - (flightNumberHeaderX/3), y: deptTimeheaderY, width: backgoundView.frame.width/3, height: 50)
        numberLabel.frame = CGRect(x: flightNumberHeaderX - (flightNumberHeaderX/3), y: deptTimeheaderY + 20, width: backgoundView.frame.width/3, height: 50)
        
        //destinationHeaderLabel
        destinationHeaderLabel.frame = CGRect(x: destinationX + 10, y: deptTimeheaderY, width: destinationW - 10, height: 50)
        flightDestinationLabel.frame = CGRect(x: destinationX + 10, y: deptTimeheaderY + 20, width: destinationW - 10, height: 50)
    }
    
    private func setupFrameForHasNoTitleImage () {
        
        backgoundView.frame = CGRect(x: viewPadding, y: viewPadding, width: frame.width - (viewPadding*2), height: frame.height - viewPadding)
        
        let backgoundViewFrame = backgoundView.frame
        let cLeftX = backgoundViewFrame.origin.x + padding
        
        //departureTimeLabel
        departureTimeLabel.frame = CGRect(x: cLeftX, y: backgoundViewFrame.origin.y + padding, width: 100, height: 30)
        
        let dpsX = backgoundViewFrame.width - (backgoundViewFrame.width/5.9)
        //departureStatusImageView
        departureStatusImageView.frame = CGRect(x: dpsX - 10, y: backgoundViewFrame.origin.y + padding + 10, width: 10, height: 10)
        
        //departureStatusLabel
        departureStatusLabel.frame = CGRect(x: dpsX, y: backgoundViewFrame.origin.y + padding, width: backgoundViewFrame.width/5.9, height: 30)
        
        //seperatorLine
        seperatorLine.frame = CGRect(x: cLeftX, y: backgoundViewFrame.origin.y + padding + 30, width: backgoundViewFrame.width - (backgoundViewFrame.origin.x + padding), height: 0.5)
        
        let avTitleY = seperatorLine.frame.origin.y + 20
        //avatarImage
        avatarImageView.frame = CGRect(x: cLeftX, y: avTitleY, width: frame.width/5, height: frame.width/5)
        
        //airportNameLabel
        let nameX = cLeftX + avatarImageView.frame.width + 20
        let w = backgoundView.frame.width - (avatarImageView.frame.width + cLeftX + 20)
        flightNameLabel.frame = CGRect(x: nameX, y: avTitleY, width: w, height: avatarImageView.frame.height/3)
        
        //flightDestinationLabel
        flightDestinationLabel.frame = CGRect(x: nameX, y: avTitleY + flightNameLabel.frame.height, width: w, height: avatarImageView.frame.height/3)
        
        //numberLabel
        numberLabel.frame = CGRect(x: nameX, y: avTitleY + (flightNameLabel.frame.height * 2), width: w, height: avatarImageView.frame.height/3)
    }
    
}
