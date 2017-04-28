//
//  matchInfoViewController.swift
//  Golf1
//
//  Created by KINNY, JASON on 2/15/17.
//  Copyright © 2017 SRIKANTH, NIKHIL. All rights reserved.
//

import UIKit
import MessageUI

class matchInfoViewController: UIViewController, MFMailComposeViewControllerDelegate {

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
        name.text = "\(passedRound.firstName) \(passedRound.lastName)"
        //Create the match information using the course and date
        let matchDate = passedRound.date.description
        let endVal = matchDate.index(matchDate.startIndex, offsetBy: 10)
        let dateSub = matchDate.substring(to: endVal)
        courseData.text = " at \(passedRound.location) on \(dateSub)"
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
        greensData.text = String(passedRound.greens)
        
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
    
    @IBAction func exportFile(_ sender: Any) {
        let matchExport: [String] = [",First Name,Last Name,Date,Location,Weather,Score,Putts,Fairways,Penalties,UpDownAtt,UpDownComp,ScoringClub,Rank\r\n",passedRound.firstName.description,passedRound.lastName.description,passedRound.date.description,passedRound.location.description,weatherData.text!,scoreData.text!,greensData.text!,puttData.text!,fairwayData.text!,penaltyData.text!,upDownAttData.text!,upDownCompData.text!,scoringClubData.text!,finishData.text!]
        
        let inputString = matchExport.joined(separator: ",")
        
        let data = inputString.data(using: String.Encoding.utf8, allowLossyConversion: false)
        if let content = data {
            print("NSData: \(content)")
        }
        
        // Generating the email controller.
        func configuredMailComposeViewController() -> MFMailComposeViewController {
            let emailController = MFMailComposeViewController()
            emailController.mailComposeDelegate = self
            emailController.setSubject("Round Report for \(name.text!)")
            emailController.setMessageBody("Round Report for \(name.text!) golfing \(holesPlayedData.text!)\(courseData.text!)", isHTML: false)
            emailController.setToRecipients(["brian.johnson@district196.org", "david.loeffler@district196.org"])
            
            // Attaching the .CSV file to the email.
            emailController.addAttachmentData(data!, mimeType: "text/csv", fileName: "Round.csv")
            
            return emailController
        }
        
        // If the view controller can send the email.
        // This will show an email-style popup that allows you to enter
        // Who to send the email to, the subject, the cc's and the message.
        // As the .CSV is already attached, you can simply add an email
        // and press send.
        let emailViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(emailViewController, animated: true, completion: nil)
            Swift.print(MFMailComposeViewController.canSendMail())
            func mailComposeController(controller: MFMailComposeViewController,
                                       didFinishWithResult result: MFMailComposeResult, error: NSError?) {
                // Check the result or perform other tasks.
                
                // Dismiss the mail compose view controller.
                controller.dismiss(animated: true, completion: nil)
            }

        }
       
    }
}
