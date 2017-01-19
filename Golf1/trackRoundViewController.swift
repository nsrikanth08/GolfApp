//
//  trackRoundViewController.swift
//  Golf1
//
//  Created by KINNY, JASON on 12/14/16.
//  Copyright © 2016 SRIKANTH, NIKHIL. All rights reserved.
//

import UIKit

var allRound = [Round]()
//Master array that holds all matchInfo objects that are entered

class trackRoundViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var weather: UITextField!
    @IBOutlet weak var location: UITextField!
    
    var weatherdata = ["Sunny","Cloudy","Rain"]
    var picker = UIPickerView()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(trackRoundViewController.dismissKeyboard)))
        
        picker.delegate = self
        picker.dataSource = self
        weather.inputView = picker
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return weatherdata.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        weather.text = weatherdata[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return weatherdata[row]
    }
    

    func dismissKeyboard()
    {
        firstName.resignFirstResponder()
        lastName.resignFirstResponder()
        weather.resignFirstResponder()
        location.resignFirstResponder()
    }
    
    var currentInfo: Round? = nil
    //Initialize a variable for the object to be temporarily placed in the MatchInfo page

    @IBAction func storeInfo(_ sender: AnyObject) {
        //This function puts all entered fields into an object and then appends that to the master array
        
        currentInfo = Round(firstName: firstName.text!, lastName: lastName.text!, weather: weather.text!, location: location.text!)
        
        allRound.append(currentInfo!)
        
        firstName.text = ""
        lastName.text = ""
        weather.text = ""
        location.text = ""
    
        
        
    }
    
    

    

}
