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
<<<<<<< Updated upstream
        let roundName  = allRounds[indexPath.row].location
=======
        let locationName  = allRound[indexPath.row].getLocation()
        var matchDate = allRound[indexPath.row].getDate().description
        
        let dateSub = matchDate.substring(from: <#T##String.Index#>)
        matchDate = dateSub
        let roundName = locationName + "\t" + matchDate
>>>>>>> Stashed changes
        cell.textLabel?.text = roundName
        return cell
    }
    
    
<<<<<<< Updated upstream
=======
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var cellx = tableView.cellForRow(at: indexPath)
        
    }
>>>>>>> Stashed changes
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
