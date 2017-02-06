//
//  secondTrackRoundViewController.swift
//  Golf1
//
//  Created by KINNY, JASON on 12/16/16.
//  Copyright © 2016 SRIKANTH, NIKHIL. All rights reserved.
//

import Foundation
import UIKit
import os.log



class seocndTrackRoundViewController: UIViewController {
    
    @IBOutlet weak var practiceSwitch: UISwitch!
    @IBOutlet weak var practiceLabel: UILabel!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var weather: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var putts: UITextField!
    @IBOutlet weak var fairways: UITextField!
    @IBOutlet weak var penalties: UITextField!
    @IBOutlet weak var updownAttempts: UITextField!
    @IBOutlet weak var updownCompletes: UITextField!
    @IBOutlet weak var scoringClub: UITextField!
    @IBOutlet weak var finishRank: UITextField!
    @IBOutlet weak var score: UITextField!
    
    @IBAction func submit1(_ sender: AnyObject) {
        if firstName.text == "" {
            submit1Tapped()
        }
    }
    
    func submit1Tapped() {
        // create the alert
        let alert = UIAlertController(title: "You have left a text field empty", message: "Make sure to completely fill statistics", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in
            // ...
        }
        alert.addAction(OKAction)
        
        // show the alert
        self.present(alert, animated: true, completion: nil)

    }
    
    
    
    @IBOutlet weak var scrollview: UIScrollView!
    var height = UIScreen.main.bounds.height
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(seocndTrackRoundViewController.dismissKeyboard)))
        
        scrollview.isScrollEnabled = true
        scrollview.contentSize.height = height * 1.15
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard()
    {
        firstName.resignFirstResponder()
        lastName.resignFirstResponder()
        weather.resignFirstResponder()
        location.resignFirstResponder()
        putts.resignFirstResponder()
        fairways.resignFirstResponder()
        penalties.resignFirstResponder()
        updownAttempts.resignFirstResponder()
        updownCompletes.resignFirstResponder()
        scoringClub.resignFirstResponder()
        finishRank.resignFirstResponder()
        score.resignFirstResponder()
        
    }
    
    @IBAction func practiceSwitchTapped(_ sender: AnyObject) {
        updatePracticeSwitch()
    }
    
    
    func updatePracticeSwitch() {
        if practiceSwitch.isOn{
            practiceLabel.text = "Practice"
        }
        else {
            practiceLabel.text = "Competition"
        }
    }
    
    //set the currentInfo to nil so that the variable can be changed inside the method.
    var currentInfo: Round? = nil
    
    /*
     * This function puts all entered fields into an object and then appends that to the master array.
     */
    @IBAction func storeData(_ sender: AnyObject) {

        if (firstName.text == "" || lastName.text == "" || weather.text == "" || putts.text == "" || fairways.text == "" || penalties.text == "" || updownAttempts.text == "" || updownCompletes.text == "" || scoringClub.text == "" || finishRank.text == "" || score.text == "")
        {
            // create the alert
            let alert = UIAlertController(title: "You have left a text field empty", message: "Make sure to completely fill statistics", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            let OKAction = UIAlertAction(title: "OK", style: .default) { action in
                // ...
            }
            alert.addAction(OKAction)
            
            // show the alert
            self.present(alert, animated: true, completion: nil)        }
            
        else {
            saveRounds()
        }
    
        
    
    firstName.text = ""
    lastName.text = ""
    weather.text = ""
    location.text = ""
    score.text = ""
    fairways.text = ""
    penalties.text = ""
    putts.text = ""
    updownAttempts.text = ""
    updownCompletes.text = ""
    scoringClub.text = ""
    finishRank.text = ""

    }
}
