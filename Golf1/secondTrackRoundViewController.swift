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



class seocndTrackRoundViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
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
    
    var locationdata = ["Bellwood Oaks GC", "Bent Creek GC", "Boulder Pointe GC", "Bracketts Crossing CC", "Braemar GC", "Bunker HIlls GC (North-East-West)", "Bunker Hills GC (East-West)", "Chaska Town Course", "Creeks Bend GC", "Crystal Lake GC", "Dahlgren GC", "Dakota Pines GC", "Dwan GC", "Eagle Ridge GC", "Eagle Valley GC", "Eastwood GC", "Emerald Greens (Gold) GC", "Emerald Greens (Silver) GC", "Fountain Valley GC", "Goodrich GC", "Hazeltine CC", "Heritage Links GC", "Indian Hills CC", "Inver Wood GC", "Keller GC", "Legacy GC", "Meadows at Mystic Lake", "Mendakota CC", "Midland Hills CC", "Minnesota Valley CC", "Mississippi Dunes", "Olympic Hills CC", "Pokegama GC", "Prestwick CC", "River Oaks GC", "Southern Hills GC", "Southview CC", "St. Cloud CC", "Stillwater CC", "Stonebrooke GC", "Valleywood GC", "Wilds GC"]
    
    var picker = UIPickerView ()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(seocndTrackRoundViewController.dismissKeyboard)))
        
        scrollview.isScrollEnabled = true
        scrollview.contentSize.height = height * 1.15
        
        picker.delegate = self
        picker.dataSource = self
        location.inputView = picker
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locationdata.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        location.text = locationdata[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locationdata[row]
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
    
    
    
    @IBAction func numHoleSwitchTapped(_ sender: AnyObject) {
        updateNumHoleSwitch()
    }
    
    func updateNumHoleSwitch() {
        if numHolesSwitch.isOn {
            numHolesLabel.text = "18 Holes"
        }
        else {
            numHolesLabel.text = "9 Holes"
            passedRound.holesPlayed = false
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
            passedRound.isPracticeRound = false
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
            
        else {
            currentInfo = Round(firstName: firstName.text!, lastName: lastName.text!, weather: weather.text!, location: location.text!, score: Int(score.text!)!,fairways: Int(fairways.text!)!, penalties: Int(penalties.text!)!, putts: Int(putts.text!)!, upDownAtt: Int(updownAttempts.text!)!, upDownComp: Int(updownCompletes.text!)!, scoringClub: Int(scoringClub.text!)!, finishRank: Int(finishRank.text!)!, date: NSDate())
            
            allRounds.append(currentInfo!)
            saveRounds()
            performSegue(withIdentifier: "showPreviousRoundsVC", sender: self)
            //self.present(previousRoundsViewController(), animated: false, completion: nil)
        }
        /*firstName.text = ""
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
        finishRank.text = ""*/
    }
}
