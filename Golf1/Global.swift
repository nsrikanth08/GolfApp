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

/*
 *  MAXIMUM EFFICIENCY
 */
extension String
{
    func substring(_ start: Int, end: Int) -> String
    {
        
        
        let endVal = self.characters.index(self.startIndex, offsetBy: end + 1)
        let startVal = self.characters.index(self.startIndex, offsetBy: start, limitedBy: endVal)
        return self.substring(with: (startVal! ..< endVal))
        
        //return self.substringWithRange(Range<String.Index>(start: self.startIndex.advancedBy(start), end: self.startIndex.advancedBy(end + 1)))
    }
    func indexOf(_ string: String) -> String.Index? {
        return range(of: string, options: .literal, range: nil, locale: nil)?.lowerBound
    }
}
