//
//  Round.swift
//  Golf1
//
//  Created by WILARY, BRANDON on 12/13/16.
//  Copyright © 2016 SRIKANTH, NIKHIL. All rights reserved.
//

import Foundation

class Round {
    
    //practice round boolean that will need to be implemented after the practice round mode is created.
    private let isPracticeRound: Bool
    
    //Initialize the class instance variables
    private var score, fairwayPerc, penalties, putts, greens, upDownPerc: Int
    private var date: NSDate
    
    /* Constructor for the Round class. Creates a storage device for all match information that the user would require.
     *
     * @param int score. This is a user input int that reflects the total amount of shots taken during a round.
     * @param int fairways. This is a user input int that reflects the total amount of fairways hit during play.
     * @param int penalties. This is a user input int that reflects the total amount of penalties recieved during play.
     * @param int putts.  This is a user input int that reflects the total amount of putts taken during the round.
     * @param int greens.  This is a user input int that reflects the total amount of greens hit during play.
     * @param int upDownAtt.  This is a user input int that reflects the total amount of up down attempts taken.
     * @param int upDownComp.  This is a user input int that reflects the total amount of up downs that are completed.
     */
    init(score: Int, fairways: Int, penalties: Int, putts: Int, greens: Int, upDownAtt: Int, upDownComp: Int) {
        self.isPracticeRound = false
        self.score = score
        self.fairwayPerc = Int((Double(fairways) / Double(score)) * 100.0)
        self.penalties = penalties
        self.putts = putts
        self.greens = greens
        self.upDownPerc = Int((Double(upDownComp) / Double(upDownAtt)) * 100.0)
        self.date = NSDate()
    }
    
    //Create a framework that allows the user to change the instance variables in case of a user input error.
    func setScore(newScore: Int) {
        self.score = newScore
    }

    func setPenalties(newPenalties: Int) {
        self.penalties = newPenalties
    }
    
    func setPutts(newPutts: Int) {
        self.putts = newPutts
    }
    
    func setGreens(newGreens: Int) {
        self.greens = newGreens
    }
    
    func setUpDown(newUpDownAtt: Int, newUpDownComp: Int) {
        self.upDownPerc = Int((Double(newUpDownComp) / Double(newUpDownAtt)) * 100.0)
    }
    
    func setFairwayPerc(newScore: Int, newFairways: Double) {
        self.fairwayPerc = Int((newFairways / Double(newScore)) * 100.0)
    }
    
}
