//
//  Round.swift
//  Golf1
//
//  Created by WILARY, BRANDON on 12/13/16.
//  Copyright © 2016 SRIKANTH, NIKHIL. All rights reserved.
//

import Foundation

class Round {
    
    
    let isPracticeRound = false
    
    let score, fairways, penalties, putts, greens, upDownAtt, upDownComp: Int
    let date: NSDate
    
    init(score: Int, fairways: Int, penalties: Int, putts: Int, greens: Int, upDownAtt: Int, upDownComp: Int) {
        self.score = score
        self.fairways = fairways
        self.penalties = penalties
        self.putts = putts
        self.greens = greens
        self.upDownAtt = upDownAtt
        self.upDownComp = upDownComp
        self.date = NSDate()
    }
}
