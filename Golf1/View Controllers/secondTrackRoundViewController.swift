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
    
    @IBOutlet weak var numHolesSwitch: UISwitch!
    @IBOutlet weak var numHolesLabel: UILabel!
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
    @IBOutlet weak var greens: UITextField!
    
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
        scrollview.contentSize.height = height * 1.5

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func dismissKeyboard()
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
    
    @IBAction func numHoleSwitchTapped(_ sender: AnyObject) {
        updateNumHoleSwitch()
    }
    
    func updateNumHoleSwitch() {
        if numHolesSwitch.isOn {
            numHolesLabel.text = "18 Holes"
        }
        else {
            numHolesLabel.text = "9 Holes"
            //passedRound.holesPlayed = false
        }
    }
    
    
    @IBAction func practiceSwitchTapped(_ sender: AnyObject) {
        updatePracticeSwitch()
    }
    
    
    func updatePracticeSwitch() {
        if practiceSwitch.isOn{
            practiceLabel.text = "Competition"
        }
        else {
            practiceLabel.text = "Practice"
        }
    }
    
    func isAnInt(string: String) -> Bool {
        return Int(string) != nil
    }
    
    
    
    
    //set the currentInfo to nil so that the variable can be changed inside the method.
    var currentInfo: Round? = nil
    
    /*
     * This function puts all entered fields into an object and then appends that to the master array.
     */
    @IBAction func storeData(_ sender: AnyObject) {
        
        var is18Holes, isPracticeRound: Bool
        
        
        if numHolesSwitch.isOn {
            is18Holes = true
        }
        
        else {
            is18Holes = false
        }
        
        if practiceSwitch.isOn {
            isPracticeRound = true
        }

        else {
            isPracticeRound = false
        }
        
        //Checks for blank text fields
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
            self.present(alert, animated: true, completion: nil)
        }
        
        //Check if number is entered in letter value
        else if ((isAnInt(string: firstName.text!)) || (isAnInt(string: lastName.text!)) || (isAnInt(string: weather.text!))) {
            
            let alert = UIAlertController(title: "You have entered the wrong data type", message: "Make sure to remove any numbers from names, weather descriptions and locations.", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { action in
                // ...
            }
            alert.addAction(OKAction)
            self.present(alert, animated: true, completion: nil)
        }
        
        //Checks if letters are entered in numeric value
        else if (!(isAnInt(string: putts.text!)) || !(isAnInt(string: fairways.text!)) || !(isAnInt(string: penalties.text!)) || !(isAnInt(string: updownAttempts.text!)) || !(isAnInt(string: updownCompletes.text!)) || !(isAnInt(string: scoringClub.text!)) || !(isAnInt(string: finishRank.text!)) || !(isAnInt(string: score.text!))) {
            
            let alert = UIAlertController(title: "You have entered the wrong data type", message: "Make sure to enter numeric values for all of the round statistics.", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { action in
                // ...
            }
            alert.addAction(OKAction)
            self.present(alert, animated: true, completion: nil)
        }
            
        //Checks if Up/Down attempts are greater than Up/Down completes
        else if (Int(updownAttempts.text!)! < Int(updownCompletes.text!)!) {
            let alert = UIAlertController(title: "Data doesn't make sense", message: "Make sure attempts are not less than completes", preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { action in
                // ...
            }
            alert.addAction(OKAction)
            self.present(alert, animated: true, completion: nil)
            
        }
            
        else {
            currentInfo = Round(firstName: firstName.text!, lastName: lastName.text!, weather: weather.text!, location: location.text!, score: Int(score.text!)!,fairways: Int(fairways.text!)!, penalties: Int(penalties.text!)!, putts: Int(putts.text!)!, upDownAtt: Int(updownAttempts.text!)!, upDownComp: Int(updownCompletes.text!)!, scoringClub: Int(scoringClub.text!)!, finishRank: Int(finishRank.text!)!, greens: Int(greens.text!)!, date: NSDate(), holesPlayed: is18Holes, isPracticeRound: isPracticeRound)
            
            allRounds.append(currentInfo!)
            saveRounds()
            performSegue(withIdentifier: "showPreviousRoundsVC", sender: self)
        }
    }
}
