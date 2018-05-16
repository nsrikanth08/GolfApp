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

//MARK:Constants
//creates file name for saving rounds
var fileFolder: String {
    
    let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    
    return DocumentsDirectory.appendingPathComponent("Golf1SaveFolder").path
}

var round: Round?

//MARK: SAVING FUNCTIONS AND DECLARATION
var allRounds = [Round]()
let defaults = UserDefaults.standard
let kDataKey = "allRounds"

func saveRounds() {
    let jsonEncoder = JSONEncoder()
    do {
        let jsonData = try jsonEncoder.encode(allRounds)
        let jsonString = String(data: jsonData, encoding: .utf8)
        print("JSON String : " + jsonString!)
        //save data
        NSKeyedArchiver.archiveRootObject(jsonData, toFile: fileFolder)
    }
    catch {
    }
    
}

func loadRounds() {
    //load data
    guard let jsonData = NSKeyedUnarchiver.unarchiveObject(withFile: fileFolder) as? Data else { return }
    let jsonDecoder = JSONDecoder()
    do {
        //Decode data
        allRounds = try jsonDecoder.decode([Round].self, from: jsonData)
    }
    catch {
    }
}

//MARK: Averaging functions
//Date information for averaging rounds

var avgDate: String{
    let currentDate = NSDate()
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    return dateFormatter.string(from: currentDate as Date)
}

func average18Comp(last10: Bool) -> Round {
    var averageRound: Round
    var scoreAverage = 0
    var fairwayAverage = 0
    var penaltyAverage = 0
    var puttAverage = 0
    var upDownAttTotal = 0
    var upDownCompTotal = 0
    var scoringClubAverage = 0
    var finishRankAverage = 0
    var greensAverage = 0
    var totalRounds = 0.0
    var upTo10 = 0
    
    for currentRound in allRounds {
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
            greensAverage += currentRound.greens
            
            if last10 {
                upTo10 += 1
            }
        }
        if upTo10 >= 10 {
            break
        }
    }
    
    //MUST DIVIDE BY 10 ON THE AVERAGES GUI TO GET A DECIMAL
    if totalRounds != 0 {
        scoreAverage = Int(Double(scoreAverage * 10)/totalRounds + 0.5)
        fairwayAverage = Int(Double(fairwayAverage * 10)/totalRounds + 0.5)
        penaltyAverage = Int(Double(penaltyAverage * 10)/totalRounds + 0.5)
        puttAverage = Int(Double(puttAverage * 10)/totalRounds + 0.5)
        scoringClubAverage = Int(Double(scoringClubAverage * 10)/totalRounds + 0.5)
        finishRankAverage = Int(Double(finishRankAverage * 10)/totalRounds + 0.5)
        greensAverage = Int(Double(greensAverage * 10)/totalRounds + 0.5)
        upDownCompTotal = upDownCompTotal * 1000
    }
    
    averageRound = Round(firstName: "", lastName: "", weather: "", location: "", score: scoreAverage, fairways: fairwayAverage, penalties: penaltyAverage, putts: puttAverage, upDownAtt: upDownAttTotal, upDownComp: upDownCompTotal, scoringClub: scoringClubAverage, finishRank: finishRankAverage, greens: greensAverage, date: avgDate, holesPlayed: true, isPracticeRound: true)
    
    return averageRound
}

func average9Comp(last10: Bool) -> Round {
    var averageRound: Round
    var scoreAverage = 0
    var fairwayAverage = 0
    var penaltyAverage = 0
    var puttAverage = 0
    var upDownAttTotal = 0
    var upDownCompTotal = 0
    var scoringClubAverage = 0
    var finishRankAverage = 0
    var greensAverage = 0
    var totalRounds = 0.0
    var upTo10 = 0
    
    for currentRound in allRounds {
        if currentRound.isPracticeRound {
            if currentRound.holesPlayed{
                totalRounds += 1
                scoreAverage += currentRound.score / 2
                fairwayAverage += currentRound.fairways / 2
                penaltyAverage += currentRound.penalties / 2
                puttAverage += currentRound.putts / 2
                upDownAttTotal += currentRound.upDownAtt / 2
                upDownCompTotal += currentRound.upDownComp / 2
                scoringClubAverage += currentRound.scoringClub / 2
                finishRankAverage += currentRound.finishRank / 2
            }
            else{
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
            
            
            if last10 {
                upTo10 += 1
            }
        }
        if upTo10 >= 10 {
            break
        }
    }
    
    //MUST DIVIDE BY 10 ON THE AVERAGES GUI TO GET A DECIMAL
    if totalRounds != 0 {
        scoreAverage = Int(Double(scoreAverage * 10)/totalRounds + 0.5)
        fairwayAverage = Int(Double(fairwayAverage * 10)/totalRounds + 0.5)
        penaltyAverage = Int(Double(penaltyAverage * 10)/totalRounds + 0.5)
        puttAverage = Int(Double(puttAverage * 10)/totalRounds + 0.5)
        scoringClubAverage = Int(Double(scoringClubAverage * 10)/totalRounds + 0.5)
        finishRankAverage = Int(Double(finishRankAverage * 10)/totalRounds + 0.5)
        greensAverage = Int(Double(greensAverage * 10)/totalRounds + 0.5)
        upDownCompTotal = upDownCompTotal * 1000
    }
    
    averageRound = Round(firstName: "", lastName: "", weather: "", location: "", score: scoreAverage, fairways: fairwayAverage, penalties: penaltyAverage, putts: puttAverage, upDownAtt: upDownAttTotal, upDownComp: upDownCompTotal, scoringClub: scoringClubAverage, finishRank: finishRankAverage, greens: greensAverage, date: avgDate, holesPlayed: false, isPracticeRound: true)
    
    return averageRound
}

func average9Prac(last10: Bool) -> Round {
    var averageRound: Round
    var scoreAverage = 0
    var fairwayAverage = 0
    var penaltyAverage = 0
    var puttAverage = 0
    var upDownAttTotal = 0
    var upDownCompTotal = 0
    var scoringClubAverage = 0
    var finishRankAverage = 0
    var greensAverage = 0
    var totalRounds = 0.0
    var upTo10 = 0
    
    for currentRound in allRounds {
        if  !currentRound.isPracticeRound {
            if currentRound.holesPlayed{
                totalRounds += 1
                scoreAverage += currentRound.score / 2
                fairwayAverage += currentRound.fairways / 2
                penaltyAverage += currentRound.penalties / 2
                puttAverage += currentRound.putts / 2
                upDownAttTotal += currentRound.upDownAtt / 2
                upDownCompTotal += currentRound.upDownComp / 2
                scoringClubAverage += currentRound.scoringClub / 2
                finishRankAverage += currentRound.finishRank / 2
            }
            else{
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
            
            if last10 {
                upTo10 += 1
            }
        }
        if upTo10 >= 10 {
            break
        }
    }
    
    //MUST DIVIDE BY 10 ON THE AVERAGES GUI TO GET A DECIMAL
    if totalRounds != 0 {
        scoreAverage = Int(Double(scoreAverage * 10)/totalRounds + 0.5)
        fairwayAverage = Int(Double(fairwayAverage * 10)/totalRounds + 0.5)
        penaltyAverage = Int(Double(penaltyAverage * 10)/totalRounds + 0.5)
        puttAverage = Int(Double(puttAverage * 10)/totalRounds + 0.5)
        scoringClubAverage = Int(Double(scoringClubAverage * 10)/totalRounds + 0.5)
        finishRankAverage = Int(Double(finishRankAverage * 10)/totalRounds + 0.5)
        greensAverage = Int(Double(greensAverage * 10)/totalRounds + 0.5)
        upDownCompTotal = upDownCompTotal * 1000
    }
    
    averageRound = Round(firstName: "", lastName: "", weather: "", location: "", score: scoreAverage, fairways: fairwayAverage, penalties: penaltyAverage, putts: puttAverage, upDownAtt: upDownAttTotal, upDownComp: upDownCompTotal, scoringClub: scoringClubAverage, finishRank: finishRankAverage, greens: greensAverage, date: avgDate, holesPlayed: false, isPracticeRound: false)
    
    return averageRound
}

func average18Prac(last10: Bool) -> Round {
    var averageRound: Round
    var scoreAverage = 0
    var fairwayAverage = 0
    var penaltyAverage = 0
    var puttAverage = 0
    var upDownAttTotal = 0
    var upDownCompTotal = 0
    var scoringClubAverage = 0
    var finishRankAverage = 0
    var greensAverage = 0
    var totalRounds = 0.0
    var upTo10 = 0
    
    for currentRound in allRounds {
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
            
            if last10 {
                upTo10 += 1
            }
        }
        if upTo10 >= 10 {
            break
        }
    }
    
    //MUST DIVIDE BY 10 ON THE AVERAGES GUI TO GET A DECIMAL
    if totalRounds != 0 {
        scoreAverage = Int(Double(scoreAverage * 10)/totalRounds + 0.5)
        fairwayAverage = Int(Double(fairwayAverage * 10)/totalRounds + 0.5)
        penaltyAverage = Int(Double(penaltyAverage * 10)/totalRounds + 0.5)
        puttAverage = Int(Double(puttAverage * 10)/totalRounds + 0.5)
        scoringClubAverage = Int(Double(scoringClubAverage * 10)/totalRounds + 0.5)
        finishRankAverage = Int(Double(finishRankAverage * 10)/totalRounds + 0.5)
        greensAverage = Int(Double(greensAverage * 10)/totalRounds + 0.5)
        upDownCompTotal = upDownCompTotal * 1000
    }
    
    averageRound = Round(firstName: "", lastName: "", weather: "", location: "", score: scoreAverage, fairways: fairwayAverage, penalties: penaltyAverage, putts: puttAverage, upDownAtt: upDownAttTotal, upDownComp: upDownCompTotal, scoringClub: scoringClubAverage, finishRank: finishRankAverage, greens: greensAverage, date: avgDate, holesPlayed: true, isPracticeRound: false)
    
    return averageRound
}
