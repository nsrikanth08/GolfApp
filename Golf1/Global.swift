//
//  Global.swift
//  Golf1
//
//  Created by SRIKANTH, NIKHIL on 2/3/17.
//  Copyright © 2017 SRIKANTH, NIKHIL. All rights reserved.
//


import Foundation
import UIKit
import os.log

var passedRound: Round!

//SAVING FUNCTIONS AND DECLARATION
internal var allRounds: [Round] = []
let defaults = UserDefaults.standard
let kDataKey = "allRounds"

func saveRounds() {
    let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: allRounds)
    defaults.set(encodedData, forKey: kDataKey)
    defaults.synchronize()}

func loadRounds() -> [Round]? {
    if let _ = defaults.object(forKey: kDataKey)
    {
        let decoded = defaults.object(forKey: kDataKey) as! Data
        let testAuth = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [Round]
        return testAuth
    }
    return []
}
