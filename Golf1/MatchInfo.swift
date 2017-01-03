//
//  MatchInfo.swift
//  Golf1
//
//  Created by SRIKANTH, NIKHIL on 12/16/16.
//  Copyright © 2016 SRIKANTH, NIKHIL. All rights reserved.
//

import Foundation

class matchInfo {
    
    
    let firstName, lastName, weather, location: String
    let date: NSDate
    
    init(firstName: String, lastName: String, date: NSDate, weather: String, location: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.date = date
        self.weather = weather
        self.location = location
    }
}
