//
//  Round.swift
//  Golf1
//
//  Created by WILARY, BRANDON on 12/13/16.
//  Copyright © 2016 SRIKANTH, NIKHIL. All rights reserved.
//

//CHANGE INITIALIZER AND ENCODERS




import Foundation
import UIKit
import os.log

class Round: Codable {
    
    
    //MARK: Properties
    
    var isPracticeRound, holesPlayed: Bool
    var firstName, lastName, weather, location, date: String
    var score, fairways, penalties, putts, upDownAtt, upDownComp, finishRank, scoringClub, greens: Int
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("allRounds")
    
    //MARK: Initialization
    
    init(firstName: String, lastName: String, weather: String, location: String, score: Int, fairways: Int, penalties: Int, putts: Int, upDownAtt: Int,upDownComp: Int, scoringClub: Int, finishRank: Int, greens: Int, date: String, holesPlayed: Bool, isPracticeRound: Bool) {
        
        self.isPracticeRound = isPracticeRound
        self.holesPlayed = holesPlayed
        self.firstName = firstName
        self.lastName = lastName
        self.weather = weather
        self.location = location
        self.score = score
        self.fairways = fairways
        //self.fairwayPerc = Int((Double(fairways) / Double(score)) * 100.0)
        self.penalties = penalties
        self.putts = putts
        self.upDownAtt = upDownAtt
        self.upDownComp = upDownComp
        //self.upDownPerc = Int((Double(upDownComp) / Double(upDownAtt)) * 100.0)
        self.scoringClub = scoringClub
        self.finishRank = finishRank
        self.greens = greens
        self.date = date
        
    }
    
    
}
