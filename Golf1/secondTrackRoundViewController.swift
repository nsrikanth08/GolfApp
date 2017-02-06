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
    
    var locationdata = ["Braemar GC", "Wilds GC", "Hazeltine CC", "Eagle Valley GC", "Indian Hills CC", "Pokegama GC", "Eagle Ridge GC", "Stillwater CC", "St. Cloud CC", "Southern Hills GC", "Bunker Hills GC (East-West)", "Bunker HIlls GC (North-East-West)", "Inver Wood GC", "Valleywood GC", "Emerald Greens (Gold) GC", "Emerald Greens (Silver) GC", "Fountain Valley GC", "Bracketts Crossing CC", "Stonebrooke GC", "Dwan GC", "Crystal Lake GC", "Heritage Links GC", "Legacy GC", "Boulder Pointe GC", "Eastwood GC", "Chaska Town Course", "Dahlgren GC", "Bent Creek GC", "Mendakota CC", "Prestwick CC", "Creeks Bend GC", "Dakota Pines GC", "Bellwood Oaks GC", "Meadows at Mystic Lake", "Keller GC", "Goodrich GC", "Olympic Hills CC", "Midland Hills CC", "Minnesota Valley CC", "Southview CC", "Mississippi Dunes", "River Oaks GC"]
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
