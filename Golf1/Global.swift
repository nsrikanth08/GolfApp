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

//SAVING FUNCTIONS AND DECLARATION
internal var allRounds: [Round] = []

func saveRounds() {
    let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(allRounds, toFile: Round.ArchiveURL.path)
    if isSuccessfulSave {
        os_log("Rounds successfully saved.", log: OSLog.default, type: .debug)
    } else {
        os_log("Failed to save groups...", log: OSLog.default, type: .error)
    }
}

func loadRounds() -> [Round]? {
    return NSKeyedUnarchiver.unarchiveObject(withFile: Round.ArchiveURL.path) as? [Round]
    
}

