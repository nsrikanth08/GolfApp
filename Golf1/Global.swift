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

func average18Comp(roundArray: [Round]) -> Round {
    var averageRound: Round
    var scoreAverage = 0
    var fairwayAverage = 0
    var penaltyAverage = 0
    var puttAverage = 0
    var upDownAttTotal = 0
    var upDownCompTotal = 0
    var scoringClubAverage = 0
    var finishRankAverage = 0
    var totalRounds = 0.0
    
    for currentRound in roundArray {
        if currentRound.holesPlayed && currentRound.isPracticeRound {
            totalRounds += 1
            scoreAverage += currentRound.score
            fairwayAverage += currentRound.fairways
            penaltyAverage += currentRound.penalties
            puttAverage += currentRound.putts
            upDownAttTotal += currentRound.upDownAtt
            upDownCompTotal += currentRound.upDownComp
            scoringClubAverage += currentRound.scoringClub
            finishRankAverage += currentRound.finishRank
        }
    }
     //MUST DIVIDE BY 10 ON THE AVERAGES GUI TO GET A DECIMAL
    scoreAverage = Int(Double(scoreAverage * 10)/totalRounds + 0.5)
    fairwayAverage = Int(Double(fairwayAverage * 10)/totalRounds + 0.5)
    penaltyAverage = Int(Double(penaltyAverage * 10)/totalRounds + 0.5)
    puttAverage = Int(Double(puttAverage * 10)/totalRounds + 0.5)
    scoringClubAverage = Int(Double(scoringClubAverage * 10)/totalRounds + 0.5)
    finishRankAverage = Int(Double(finishRankAverage * 10)/totalRounds + 0.5)
    upDownCompTotal = upDownCompTotal * 1000
    
    averageRound = Round(firstName: "", lastName: "", weather: "", location: "", score: scoreAverage, fairways: fairwayAverage, penalties: penaltyAverage, putts: puttAverage, upDownAtt: upDownAttTotal, upDownComp: upDownCompTotal, scoringClub: scoringClubAverage, finishRank: finishRankAverage, date: NSDate(), holesPlayed: true, isPracticeRound: true)
    
    return averageRound
}

func average9Comp(roundArray: [Round]) -> Round {
    var averageRound: Round
    var scoreAverage = 0
    var fairwayAverage = 0
    var penaltyAverage = 0
    var puttAverage = 0
    var upDownAttTotal = 0
    var upDownCompTotal = 0
    var scoringClubAverage = 0
    var finishRankAverage = 0
    var totalRounds = 0.0
    
    for currentRound in roundArray {
        if !currentRound.holesPlayed && currentRound.isPracticeRound {
            totalRounds += 1
            scoreAverage += currentRound.score
            fairwayAverage += currentRound.fairways
            penaltyAverage += currentRound.penalties
            puttAverage += currentRound.putts
            upDownAttTotal += currentRound.upDownAtt
            upDownCompTotal += currentRound.upDownComp
            scoringClubAverage += currentRound.scoringClub
            finishRankAverage += currentRound.finishRank
        }
    }
    //MUST DIVIDE BY 10 ON THE AVERAGES GUI TO GET A DECIMAL
    scoreAverage = Int(Double(scoreAverage * 10)/totalRounds + 0.5)
    fairwayAverage = Int(Double(fairwayAverage * 10)/totalRounds + 0.5)
    penaltyAverage = Int(Double(penaltyAverage * 10)/totalRounds + 0.5)
    puttAverage = Int(Double(puttAverage * 10)/totalRounds + 0.5)
    scoringClubAverage = Int(Double(scoringClubAverage * 10)/totalRounds + 0.5)
    finishRankAverage = Int(Double(finishRankAverage * 10)/totalRounds + 0.5)
    upDownCompTotal = upDownCompTotal * 1000
    
    averageRound = Round(firstName: "", lastName: "", weather: "", location: "", score: scoreAverage, fairways: fairwayAverage, penalties: penaltyAverage, putts: puttAverage, upDownAtt: upDownAttTotal, upDownComp: upDownCompTotal, scoringClub: scoringClubAverage, finishRank: finishRankAverage, date: NSDate(), holesPlayed: false, isPracticeRound: true)
    
    return averageRound
}

func average9Prac(roundArray: [Round]) -> Round {
    var averageRound: Round
    var scoreAverage = 0
    var fairwayAverage = 0
    var penaltyAverage = 0
    var puttAverage = 0
    var upDownAttTotal = 0
    var upDownCompTotal = 0
    var scoringClubAverage = 0
    var finishRankAverage = 0
    var totalRounds = 0.0
    
    for currentRound in roundArray {
        if !currentRound.holesPlayed && !currentRound.isPracticeRound {
            totalRounds += 1
            scoreAverage += currentRound.score
            fairwayAverage += currentRound.fairways
            penaltyAverage += currentRound.penalties
            puttAverage += currentRound.putts
            upDownAttTotal += currentRound.upDownAtt
            upDownCompTotal += currentRound.upDownComp
            scoringClubAverage += currentRound.scoringClub
            finishRankAverage += currentRound.finishRank
        }
    }
    //MUST DIVIDE BY 10 ON THE AVERAGES GUI TO GET A DECIMAL
    scoreAverage = Int(Double(scoreAverage * 10)/totalRounds + 0.5)
    fairwayAverage = Int(Double(fairwayAverage * 10)/totalRounds + 0.5)
    penaltyAverage = Int(Double(penaltyAverage * 10)/totalRounds + 0.5)
    puttAverage = Int(Double(puttAverage * 10)/totalRounds + 0.5)
    scoringClubAverage = Int(Double(scoringClubAverage * 10)/totalRounds + 0.5)
    finishRankAverage = Int(Double(finishRankAverage * 10)/totalRounds + 0.5)
    upDownCompTotal = upDownCompTotal * 1000
    
    averageRound = Round(firstName: "", lastName: "", weather: "", location: "", score: scoreAverage, fairways: fairwayAverage, penalties: penaltyAverage, putts: puttAverage, upDownAtt: upDownAttTotal, upDownComp: upDownCompTotal, scoringClub: scoringClubAverage, finishRank: finishRankAverage, date: NSDate(), holesPlayed: false, isPracticeRound: false)
    
    return averageRound
}

func average18Prac(roundArray: [Round]) -> Round {
    var averageRound: Round
    var scoreAverage = 0
    var fairwayAverage = 0
    var penaltyAverage = 0
    var puttAverage = 0
    var upDownAttTotal = 0
    var upDownCompTotal = 0
    var scoringClubAverage = 0
    var finishRankAverage = 0
    var totalRounds = 0.0
    
    for currentRound in roundArray {
        if currentRound.holesPlayed && !currentRound.isPracticeRound {
            totalRounds += 1
            scoreAverage += currentRound.score
            fairwayAverage += currentRound.fairways
            penaltyAverage += currentRound.penalties
            puttAverage += currentRound.putts
            upDownAttTotal += currentRound.upDownAtt
            upDownCompTotal += currentRound.upDownComp
            scoringClubAverage += currentRound.scoringClub
            finishRankAverage += currentRound.finishRank
        }
    }
    //MUST DIVIDE BY 10 ON THE AVERAGES GUI TO GET A DECIMAL
    scoreAverage = Int(Double(scoreAverage * 10)/totalRounds + 0.5)
    fairwayAverage = Int(Double(fairwayAverage * 10)/totalRounds + 0.5)
    penaltyAverage = Int(Double(penaltyAverage * 10)/totalRounds + 0.5)
    puttAverage = Int(Double(puttAverage * 10)/totalRounds + 0.5)
    scoringClubAverage = Int(Double(scoringClubAverage * 10)/totalRounds + 0.5)
    finishRankAverage = Int(Double(finishRankAverage * 10)/totalRounds + 0.5)
    upDownCompTotal = upDownCompTotal * 1000
    
    averageRound = Round(firstName: "", lastName: "", weather: "", location: "", score: scoreAverage, fairways: fairwayAverage, penalties: penaltyAverage, putts: puttAverage, upDownAtt: upDownAttTotal, upDownComp: upDownCompTotal, scoringClub: scoringClubAverage, finishRank: finishRankAverage, date: NSDate(), holesPlayed: true, isPracticeRound: false)
    
    return averageRound
}
