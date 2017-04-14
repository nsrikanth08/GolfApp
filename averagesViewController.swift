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
        average()
    }
    
    @IBAction func holePress(_ sender: Any) {
        if holeSwitch.isOn{
            holesLabel.text = "18 Holes"
        }
        else {
            holesLabel.text = "9 Holes"
        }
        average()
    }

    @IBAction func pracPress(_ sender: Any) {
        if practiceSwitch.isOn{
            practiceLabel.text = "Competition"
        }
        else{
            practiceLabel.text = "Practice"
        }
        average()
    }
    
    func average() {
        if practiceSwitch.isOn && holeSwitch.isOn {
            averages = average18Comp(roundArray: allRounds)
        }
        else if practiceSwitch.isOn && !holeSwitch.isOn{
            averages = average9Comp(roundArray: allRounds)
        }
        else if !practiceSwitch.isOn && !holeSwitch.isOn{
            averages = average9Prac(roundArray: allRounds)
        }
        else {
            averages = average18Prac(roundArray: allRounds)
        }
        
        averageScores.text = String(Double(averages.score) / 10.0)
        averagePutts.text = String(Double(averages.putts) / 10.0)
        averageFairways.text = String(Double(averages.fairways) / 10.0)
        averagePenalties.text = String(Double(averages.penalties) / 10.0)
        averageScoreClub.text = String(Double(averages.scoringClub) / 10.0)
        averageFinishRank.text = String(Double(averages.finishRank) / 10.0)
        upDownPerc.text = String(Double(Int(Double(averages.upDownComp)/Double(averages.upDownAtt)))/10.0) + "%"
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
