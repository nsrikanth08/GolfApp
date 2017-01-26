//
//  secondTrackRoundViewController.swift
//  Golf1
//
//  Created by KINNY, JASON on 12/16/16.
//  Copyright © 2016 SRIKANTH, NIKHIL. All rights reserved.
//

import UIKit

var allRound = [Round]()


class seocndTrackRoundViewController: UIViewController {
    
    
    
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
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(seocndTrackRoundViewController.dismissKeyboard)))
        
        scrollview.isScrollEnabled = true
        scrollview.contentSize.height = height * 1.4
        
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
    
    //set the currentInfo to nil so that the variable can be changed inside the method.
    var currentInfo: Round? = nil
    
    /*
     * This function puts all entered fields into an object and then appends that to the master array.
     */
    @IBAction func storeData(_ sender: AnyObject) {
        
    
        currentInfo = Round(firstName: firstName.text!, lastName: lastName.text!, weather: weather.text!, location: location.text!, score: Int(score.text!)!,fairways: Int(fairways.text!)!, penalties: Int(penalties.text!)!, putts: Int(putts.text!)!, upDownAtt: Int(updownAttempts.text!)!, upDownComp: Int(updownCompletes.text!)!, scoringClub: scoringClub.text!, finishRank: Int(finishRank.text!)!)
    
    allRound.append(currentInfo!)
    
    let defaults = UserDefaults.standard
    defaults.setValue(allRound, forKey: "matchInfo")
    defaults.synchronize()
        
    
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
        
    allRound.append(currentInfo!)
        
        
    }
    
}
