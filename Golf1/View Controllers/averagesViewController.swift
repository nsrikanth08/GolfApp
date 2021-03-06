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
    @IBOutlet weak var averageGreens: UITextField!
    
    @IBOutlet weak var last10Label: UILabel!
    @IBOutlet weak var last10Switch: UISwitch!
    var averages: Round!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        last10Switch.isOn = false
        last10Label.text = "All Rounds"
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
    
    @IBAction func last10Press(_ sender: Any) {
        if last10Switch.isOn{
            last10Label.text = "Last 10 Rounds"
        }
        else{
            last10Label.text = "All Rounds"
        }
        average()
    }
    
    func average() {
        if practiceSwitch.isOn && holeSwitch.isOn {
            averages = average18Comp(last10: last10Switch.isOn)
        }
        else if practiceSwitch.isOn && !holeSwitch.isOn{
            averages = average9Comp(last10: last10Switch.isOn)
        }
        else if !practiceSwitch.isOn && !holeSwitch.isOn{
            averages = average9Prac(last10: last10Switch.isOn)
        }
        else {
            averages = average18Prac(last10: last10Switch.isOn)
        }
        
        averageScores.text = String(Double(averages.score) / 10.0)
        averagePutts.text = String(Double(averages.putts) / 10.0)
        averageFairways.text = String(Double(averages.fairways) / 10.0)
        averagePenalties.text = String(Double(averages.penalties) / 10.0)
        averageScoreClub.text = String(Double(averages.scoringClub) / 10.0)
        averageFinishRank.text = String(Double(averages.finishRank) / 10.0)
        averageGreens.text = String(Double(averages.greens) / 10.0)
        if averages.upDownAtt != 0 {
            upDownPerc.text = String(Double(Int(Double(averages.upDownComp)/Double(averages.upDownAtt)))/10.0) + "%"
        }
        else {
            upDownPerc.text = "No Data"
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
