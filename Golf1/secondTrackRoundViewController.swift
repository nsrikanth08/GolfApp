//
//  secondTrackRoundViewController.swift
//  Golf1
//
//  Created by KINNY, JASON on 12/16/16.
//  Copyright © 2016 SRIKANTH, NIKHIL. All rights reserved.
//

import UIKit

var allRound = [Round]()


class seocndTrackRoundViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    
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
    
    
    @IBOutlet weak var scrollview: UIScrollView!
    var height = UIScreen.main.bounds.height
    
    @IBOutlet weak var dropdown1: UIPickerView!
    @IBOutlet weak var dropdown2: UIPickerView!
    var weatheroptions = ["1","2","3"]
    var locationsoptions = ["4","5","6"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows : Int = weatheroptions.count
        if pickerView == dropdown2 {
            countrows = self.locationsoptions.count
        }
        
        return countrows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == dropdown1 {
            let titleRow = weatheroptions[row]
            return titleRow
        }
        else if pickerView == dropdown2 {
            let titleRow = locationsoptions[row]
            return titleRow
            
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == dropdown1 {
            self.weather.text = self.weatheroptions[row]
            self.dropdown1.isHidden = true
        }
        else if pickerView == dropdown2 {
            self.location.text = self.locationsoptions[row]
            self.dropdown2.isHidden = true
            
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == self.weather) {
            self.dropdown1.isHidden = false
        }
        else if (textField == self.location) {
            self.dropdown2.isHidden = false
        }
    }
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(seocndTrackRoundViewController.dismissKeyboard)))
        
        scrollview.isScrollEnabled = true
        scrollview.contentSize.height = height * 1.1
        
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
    
    
    
    /*
     let alert = UIAlertController()
     alert.title = "Error"
     alert.message = "Enter data for every data field"
     alert.addButtonWithTitle("Close")
    */
    
    //set the currentInfo to nil so that the variable can be changed inside the method.
    var currentInfo: Round? = nil
    
    /*
     * This function puts all entered fields into an object and then appends that to the master array.
     */
    @IBAction func storeData(_ sender: AnyObject) {

        if (firstName.text == "" || lastName.text == "" || weather.text == "" || putts.text == "" || fairways.text == "" || penalties.text == "" || updownAttempts.text == "" || updownCompletes.text == "" || scoringClub.text == "" || finishRank.text == "" || score.text == "")
        {
            // alert.show()
        }
            
        else {
            currentInfo = Round(firstName: firstName.text!, lastName: lastName.text!, weather: weather.text!, location: location.text!, score: Int(score.text!)!,fairways: Int(fairways.text!)!, penalties: Int(penalties.text!)!, putts: Int(putts.text!)!, upDownAtt: Int(updownAttempts.text!)!, upDownComp: Int(updownCompletes.text!)!, scoringClub: scoringClub.text!, finishRank: Int(finishRank.text!)!)
            
            allRound.append(currentInfo!)
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
