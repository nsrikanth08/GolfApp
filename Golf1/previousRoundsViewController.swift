//
//  previousRoundsViewController.swift
//  Golf1
//
//  Created by KINNY, JASON on 12/16/16.
//  Copyright © 2016 SRIKANTH, NIKHIL. All rights reserved.
//

import Foundation
import UIKit
import os.log

class previousRoundsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var roundView: UITableView!
    @IBOutlet weak var previousInfo: UILabel!
    
    func numberOfSections(in TableView: UITableView) -> Int {
        return 1
    }
    
    var allRounds: [Round] = loadRounds()!
    
    
    //table view will return int for how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allRounds.count
    }
    
    
    
    //what is in the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let locationName  = allRounds[indexPath.row].location
        var matchDate = allRounds[indexPath.row].date.description
        let endVal = matchDate.index(matchDate.startIndex, offsetBy: 10)
        let dateSub = matchDate.substring(to: endVal)
        matchDate = dateSub
        let roundName = locationName + "\t" + matchDate
        cell.textLabel?.text = roundName
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var cellx = tableView.cellForRow(at: indexPath)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundView.reloadData()
        
        // Do any additional setup after loading the view.
        
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
