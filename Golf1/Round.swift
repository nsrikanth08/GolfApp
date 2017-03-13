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

class Round: NSObject, NSCoding {
    
    
    //MARK: Properties
    
    var isPracticeRound, holesPlayed: Bool
    var firstName, lastName, weather, location: String
    var score, fairways, penalties, putts, upDownAtt, upDownComp, finishRank, scoringClub: Int
    var date: NSDate
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("allRounds")
    
    //MARK: Types
    
    struct PropertyKey {
        static let isPracticeRound = "isPracticeRound"
        static let holesPlayed = "holesPlayed"
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let weather = "weather"
        static let location = "location"
        static let score = "score"
        static let fairways = "fairways"
        //static let fairwayPerc = "fairwayPerc"
        static let penalties = "penalties"
        static let putts = "putts"
        static let upDownAtt = "upDownAtt"
        static let upDownComp = "upDownComp"
        //static let upDownPerc = "upDownPerc"
        static let finishRank = "finishRank"
        static let date = "date"
        static let scoringClub = "scoringClub"
    }
    
    //MARK: Initialization
    
    init(firstName: String, lastName: String, weather: String, location: String, score: Int, fairways: Int, penalties: Int, putts: Int, upDownAtt: Int,upDownComp: Int, scoringClub: Int, finishRank: Int, date: NSDate, holesPlayed: Bool, isPracticeRound: Bool) {
        
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
        self.date = date
        
    }
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(holesPlayed, forKey: PropertyKey.holesPlayed)
        aCoder.encode(isPracticeRound, forKey: PropertyKey.isPracticeRound)
        aCoder.encode(firstName, forKey: PropertyKey.firstName)
        aCoder.encode(lastName, forKey: PropertyKey.lastName)
        aCoder.encode(weather, forKey: PropertyKey.weather)
        aCoder.encode(location, forKey: PropertyKey.location)
        aCoder.encode(score, forKey: PropertyKey.score)
        aCoder.encode(fairways, forKey: PropertyKey.fairways)
        //aCoder.encode(fairwayPerc, forKey: PropertyKey.fairwayPerc)
        aCoder.encode(penalties, forKey: PropertyKey.penalties)
        aCoder.encode(putts, forKey: PropertyKey.putts)
        aCoder.encode(upDownAtt, forKey: PropertyKey.upDownAtt)
        aCoder.encode(upDownComp, forKey: PropertyKey.upDownComp)
        //aCoder.encode(upDownPerc, forKey: PropertyKey.upDownPerc)
        aCoder.encode(scoringClub, forKey: PropertyKey.scoringClub)
        aCoder.encode(finishRank, forKey: PropertyKey.finishRank)
        aCoder.encode(date, forKey: PropertyKey.date)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // This makes it fail if it can't decode the name.
        guard let firstName = aDecoder.decodeObject(forKey: PropertyKey.firstName) as? String else {
            os_log("Unable to decode the first name for a Round object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        
        let lastName = aDecoder.decodeObject(forKey: PropertyKey.lastName) as! String
        let weather = aDecoder.decodeObject(forKey: PropertyKey.weather) as! String
        let location = aDecoder.decodeObject(forKey: PropertyKey.location) as! String
        
        let score = aDecoder.decodeInteger(forKey: PropertyKey.score)
        //let fairwayPerc = aDecoder.decodeInteger(forKey: PropertyKey.fairwayPerc)
        let fairways = aDecoder.decodeInteger(forKey: PropertyKey.fairways)
        let penalties = aDecoder.decodeInteger(forKey: PropertyKey.penalties)
        let putts = aDecoder.decodeInteger(forKey: PropertyKey.putts)
        let upDownAtt = aDecoder.decodeInteger(forKey: PropertyKey.upDownAtt)
        let upDownComp = aDecoder.decodeInteger(forKey: PropertyKey.upDownComp)
        //let upDownPerc = aDecoder.decodeInteger(forKey: PropertyKey.upDownPerc)
        let scoringClub = aDecoder.decodeInteger(forKey: PropertyKey.scoringClub)
        let finishRank = aDecoder.decodeInteger(forKey: PropertyKey.finishRank)
        let holesPlayed = aDecoder.decodeBool(forKey: PropertyKey.holesPlayed)
        let date = aDecoder.decodeObject(forKey: PropertyKey.date) as! NSDate
        let isPracticeRound = aDecoder.decodeBool(forKey: PropertyKey.isPracticeRound)
        
        // Must call designated initializer.
        self.init(firstName: firstName, lastName: lastName, weather: weather, location: location, score: score, fairways: fairways, penalties: penalties, putts: putts, upDownAtt: upDownAtt, upDownComp: upDownComp, scoringClub: scoringClub, finishRank: finishRank, date: date, holesPlayed: holesPlayed, isPracticeRound: isPracticeRound)
        
    }
}
