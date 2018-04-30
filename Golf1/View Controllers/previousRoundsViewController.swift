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
    //MARK: Properties
    @IBOutlet weak var roundTableView: UITableView!
    var roundList: [Round] = allRounds
    
    func numberOfSections(in TableView: UITableView) -> Int {
        return 1
    }
    
    
    //table view will return int for how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roundList.count
    }
    
    //what is in the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let locationName  = roundList[indexPath.row].location
        let matchDate = roundList[indexPath.row].date
        let label1 = UILabel(frame: CGRect(x: 15, y: 0, width: cell.frame.width/2, height: cell.frame.height))
        let label2 = UILabel(frame: CGRect(x: 2*cell.frame.width/3, y: 0, width: cell.frame.width/3, height: cell.frame.height))
        label1.text = locationName
        label2.text = matchDate
        label2.textAlignment = .right
        cell.addSubview(label1)
        cell.addSubview(label2)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        //Index value is manually set to 1 because the index value pressed on the table view is stored here
        round = roundList[(indexPath?[1])!]
        performSegue(withIdentifier: "showRound" , sender: self )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //roundTableView.reloadData()
        // Do any additional setup after loading the view.

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Enables swipe to delete functionality
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            roundList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            allRounds = roundList
            saveRounds()
        }
        
    }
    
    
}
