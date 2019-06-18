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
    var number: String?
    
    init(departureTime: String, departureStatusImage: UIImage, departureStatus: String, avatar: UIImage ,flightName: String, flightDestination: String, number: String) {
        
        self.departureTime = departureTime
        self.departureStatusImage = departureStatusImage
        self.departureStatus = departureStatus
        self.avatar = avatar
        self.flightName = flightName
        self.flightDestination = flightDestination
        self.number = number
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
                numberLabel.text = schdeule_cell.number
                
                setNeedsLayout()
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
//        self.
        
        //background
        backgroundColor = UIColor.groupTableViewBackground
        
        backgoundView = UIView(frame: .zero)
        backgoundView.alpha = 0.6
        backgoundView.layer.cornerRadius = CGFloat().cellCornerRadius
        contentView.addSubview(backgoundView)
        
        //seperatorLine
        seperatorLine = UIView(frame: .zero)
        seperatorLine.alpha = 0.6
        contentView.addSubview(seperatorLine)
        
        //departureTimeLabel
        departureTimeLabel = UILabel(frame: .zero)
        departureTimeLabel.textAlignment = .left
        departureTimeLabel.textColor = UIColor.appBlueColor
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
//        departureStatusLabel.backgroundColor = UIColor.blue
        contentView.addSubview(departureStatusLabel)
        
        //avatarImageView
        avatarImageView = UIImageView(frame: .zero)
        avatarImageView.sizeToFit()
        avatarImageView.layer.cornerRadius = 5
        contentView.addSubview(avatarImageView)
        
        //airportNameLabel
        flightNameLabel = UILabel(frame: .zero)
        flightNameLabel.textAlignment = .left
        flightNameLabel.textColor = UIColor.appDarkGrayColor
        flightNameLabel.font = UIFont.appCellFlightNameFont
        contentView.addSubview(flightNameLabel)
        
        //flightDestinationLabel
        flightDestinationLabel = UILabel(frame: .zero)
        flightDestinationLabel.textAlignment = .left
        flightDestinationLabel.textColor = UIColor.appDarkGrayColor
        flightDestinationLabel.font = UIFont.appCellTimeAndStatusFont
        contentView.addSubview(flightDestinationLabel)
        
        //numberLabel
        numberLabel = UILabel(frame: .zero)
        numberLabel.textAlignment = .left
        numberLabel.textColor = UIColor.appDarkGrayColor
        numberLabel.font = UIFont.appCellTimeAndStatusFont
        contentView.addSubview(numberLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
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
