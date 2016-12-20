//
//  trackRoundViewController.swift
//  Golf1
//
//  Created by KINNY, JASON on 12/14/16.
//  Copyright © 2016 SRIKANTH, NIKHIL. All rights reserved.
//

import UIKit

class trackRoundViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var date: UITextField!
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
    
    func dismissKeyboard() {
        firstName.resignFirstResponder()
        lastName.resignFirstResponder()
        date.resignFirstResponder()
        weather.resignFirstResponder()
        location.resignFirstResponder()
    }
    

    
    
    
    
    
    
    @IBAction func infoSubmit(_ sender: AnyObject) {
        _ = matchInfo(firstName: firstName.text!, lastName: lastName.text!, date: date.text!, weather: weather.text!, location: location.text!)
    }
    
    
    
    
    

}
