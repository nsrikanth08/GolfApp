//
//  trackRoundViewController.swift
//  Golf1
//
//  Created by KINNY, JASON on 12/14/16.
//  Copyright © 2016 SRIKANTH, NIKHIL. All rights reserved.
//

import UIKit

var allMatchInfo = [matchInfo]()
//Master array that holds all matchInfo objects that are entered

class trackRoundViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var weather: UITextField!
    @IBOutlet weak var location: UITextField!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(trackRoundViewController.dismissKeyboard)))
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
    }
    
    var currentInfo: matchInfo? = nil
    //Initialize a variable for the object to be temporarily placed in the MatchInfo page

    @IBAction func storeInfo(_ sender: AnyObject) {
        //This function puts all entered fields into an object and then appends that to the master array
        
        currentInfo = matchInfo(firstName: firstName.text!, lastName: lastName.text!, weather: weather.text!, location: location.text!)
        
        allMatchInfo.append(currentInfo!)
        
        firstName.text = ""
        lastName.text = ""
        weather.text = ""
        location.text = ""
    
        
        
    }
    
    

    

}
