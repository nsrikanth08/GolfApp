//
//  trackRoundViewController.swift
//  Golf1
//
//  Created by KINNY, JASON on 12/14/16.
//  Copyright © 2016 SRIKANTH, NIKHIL. All rights reserved.
//

import UIKit

class trackRoundViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var weather: UITextField!
    @IBOutlet weak var location: UITextField!
    
    
    var info = [matchInfo]()
    
    

}
