//
//  matchInfoViewController.swift
//  Golf1
//
//  Created by KINNY, JASON on 2/15/17.
//  Copyright © 2017 SRIKANTH, NIKHIL. All rights reserved.
//

import UIKit

class matchInfoViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var courseData: UILabel!
    @IBOutlet weak var weatherData: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create the name of golfer to be displayed
        name.text = passedRound.firstName + " " + passedRound.lastName
        let matchDate = passedRound.date.description
        let endVal = matchDate.index(matchDate.startIndex, offsetBy: 10)
        let dateSub = matchDate.substring(to: endVal)
        courseData.text = " at " + passedRound.location + " on " + dateSub
        weatherData.text = passedRound.weather
        
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
