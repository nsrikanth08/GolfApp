//
//  averagesViewController.swift
//  Golf1
//
//  Created by KINNY, JASON on 4/11/17.
//  Copyright © 2017 SRIKANTH, NIKHIL. All rights reserved.
//

import UIKit

class averagesViewController: UIViewController {

    @IBOutlet weak var holeSwitch: UISwitch!
    @IBOutlet weak var practiceSwitch: UISwitch!
    @IBOutlet weak var holesLabel: UILabel!
    @IBOutlet weak var practiceLabel: UILabel!
    @IBOutlet weak var averageScores: UITextField!
    @IBOutlet weak var averagePutts: UITextField!
    @IBOutlet weak var averageFairways: UITextField!
    @IBOutlet weak var averagePenalties: UITextField!
    @IBOutlet weak var upDownPerc: UITextField!
    @IBOutlet weak var averageScoreClub: UITextField!
    @IBOutlet weak var averageFinishRank: UITextField!
    
    var averages: Round!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func holePress(_ sender: Any) {
        if holeSwitch.isOn{
            holesLabel.text = "18 Holes"
        }
        else {
            holesLabel.text = "9 Holes"
        }
    }

    @IBAction func pracPress(_ sender: Any) {
        if practiceSwitch.isOn{
            practiceLabel.text = "Competition"
        }
        else{
            practiceLabel.text = "Practice"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
