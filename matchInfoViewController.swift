//
//  matchInfoViewController.swift
//  Golf1
//
//  Created by KINNY, JASON on 2/15/17.
//  Copyright © 2017 SRIKANTH, NIKHIL. All rights reserved.
//

import UIKit

class matchInfoViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var courseData: UILabel!
    @IBOutlet weak var weatherData: UITextField!
    @IBOutlet weak var scoreData: UITextField!
    @IBOutlet weak var puttData: UITextField!
    @IBOutlet weak var fairwayData: UITextField!
    @IBOutlet weak var penaltyData: UITextField!
    @IBOutlet weak var upDownAttData: UITextField!
    @IBOutlet weak var upDownCompData: UITextField!
    @IBOutlet weak var scoringClubData: UITextField!
    @IBOutlet weak var finishData: UITextField!
    @IBOutlet weak var roundTypeData: UITextField!
    @IBOutlet weak var holesPlayedData: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create the name of golfer to be displayed
        name.text = passedRound.firstName + " " + passedRound.lastName
        //Create the match information using the course and date
        let matchDate = passedRound.date.description
        let endVal = matchDate.index(matchDate.startIndex, offsetBy: 10)
        let dateSub = matchDate.substring(to: endVal)
        courseData.text = " at " + passedRound.location + " on " + dateSub
        //Set the text fields to the information from the passed round
        weatherData.text = passedRound.weather
        //Change the int variables back to a string
        scoreData.text = String(passedRound.score)
        puttData.text = String(passedRound.putts)
        fairwayData.text = String(passedRound.fairways)
        penaltyData.text = String(passedRound.penalties)
        upDownAttData.text = String(passedRound.upDownAtt)
        upDownCompData.text = String(passedRound.upDownComp)
        scoringClubData.text = String(passedRound.scoringClub)
        finishData.text = String(passedRound.finishRank)
        
        if (passedRound.isPracticeRound) {
            roundTypeData.text = "Competition"
        }
        else {
            roundTypeData.text = "Practice"
        }
        
        if (passedRound.holesPlayed) {
            holesPlayedData.text = "18 Holes"
        }
        else {
            holesPlayedData.text = "9 Holes"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
