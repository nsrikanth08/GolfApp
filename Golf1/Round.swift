//
//  Round.swift
//  Golf1
//
//  Created by WILARY, BRANDON on 12/13/16.
//  Copyright © 2016 SRIKANTH, NIKHIL. All rights reserved.
//

import Foundation

class Round {
    
    
    let isPracticeRound: Bool
    
    let score, fairways, penalties, putts, greens, upDownPerc: Int
    let date: NSDate
    
    init(score: Int, fairways: Int, penalties: Int, putts: Int, greens: Int, upDownAtt: Double, upDownComp: Double) {
        self.isPracticeRound = false
        self.score = score
        self.fairways = fairways
        self.penalties = penalties
        self.putts = putts
        self.greens = greens
        self.upDownPerc = (Int)((upDownComp / upDownAtt) * 100.0)
        self.date = NSDate()
    }
}
