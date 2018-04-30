//
//  matchInfoViewController.swift
//  Golf1
//
//  Created by KINNY, JASON on 2/15/17.
//  Copyright © 2017 SRIKANTH, NIKHIL. All rights reserved.
//

import UIKit

class matchInfoViewController: UIViewController {
    //MARK: Properties
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
    @IBOutlet weak var greensData: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the name of golfer to be displayed
        name.text = "\(round!.firstName) \(round!.lastName)"
        
        //Create the match information using the course and date
        courseData.text = " at \(round!.location) on \(round!.date)"
        
        //Set the text fields to the information from the passed round
        weatherData.text = round!.weather
        
        //Change the int variables back to a string
        scoreData.text = String(round!.score)
        puttData.text = String(round!.putts)
        fairwayData.text = String(round!.fairways)
        penaltyData.text = String(round!.penalties)
        upDownAttData.text = String(round!.upDownAtt)
        upDownCompData.text = String(round!.upDownComp)
        scoringClubData.text = String(round!.scoringClub)
        finishData.text = String(round!.finishRank)
        greensData.text = String(round!.greens)
        
        if (round!.isPracticeRound) {
            roundTypeData.text = "Competition"
        }
        else {
            roundTypeData.text = "Practice"
        }
        
        if (round!.holesPlayed) {
            holesPlayedData.text = "18 holes"
        }
        else {
            holesPlayedData.text = "9 holes"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exportFile(_ sender: UIButton) {
        let matchExport: [String] = [",First Name,Last Name,Date,Location,Weather,Score,Putts,Fairways,Penalties,UpDownAtt,UpDownComp,ScoringClub,Rank\r\n",round!.firstName.description,round!.lastName.description,round!.date.description,round!.location.description,weatherData.text!,scoreData.text!,greensData.text!,puttData.text!,fairwayData.text!,penaltyData.text!,upDownAttData.text!,upDownCompData.text!,scoringClubData.text!,finishData.text!]
        
        let csvString = matchExport.joined(separator: ",")
        
        //Save file info
        let fileName = "\(round?.location ?? "practice") \(round?.firstName ?? "") \(round?.lastName ?? "").csv"
        let path = NSURL(fileURLWithPath:NSTemporaryDirectory()).appendingPathComponent(fileName)
        
        //save the round csv file
        do {
            try csvString.write(to: path!, atomically: true, encoding: String.Encoding.utf8)
        }
        catch {
            print("Failed to create file")
            print("\(error)")
        }
        
        //create activity popover
        let activityView = UIActivityViewController(activityItems: [path!], applicationActivities:[])
        //modify activities
        activityView.excludedActivityTypes = [UIActivityType.assignToContact,UIActivityType.assignToContact,UIActivityType.saveToCameraRoll,UIActivityType.postToFlickr,UIActivityType.postToVimeo,UIActivityType.postToTencentWeibo,UIActivityType.postToTwitter,UIActivityType.postToFacebook,UIActivityType.openInIBooks]
        //present popover
        activityView.modalPresentationStyle = UIModalPresentationStyle.popover
        present(activityView, animated: true, completion: nil)
        let popOver = activityView.popoverPresentationController
        popOver?.sourceView = sender
    }
       
}

