//
//  ViewController.swift
//  Golf1
//
//  Created by SRIKANTH, NIKHIL on 12/13/16.
//  Copyright © 2016 SRIKANTH, NIKHIL. All rights reserved.
//
import Foundation
import UIKit
import os.log


class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var trackRound: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRounds()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
}

