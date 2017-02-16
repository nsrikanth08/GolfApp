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
    
    @IBOutlet weak var roundTableView: UITableView!
    
    var roundList: [Round] = loadRounds()!
    
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
        var matchDate = roundList[indexPath.row].date.description
        let endVal = matchDate.index(matchDate.startIndex, offsetBy: 10)
        let dateSub = matchDate.substring(to: endVal)
        matchDate = dateSub
        let label1 = UILabel(frame: CGRect(x: 0, y: 0, width: cell.frame.width/2, height: cell.frame.height))
        let label2 = UILabel(frame: CGRect(x: cell.frame.width/2, y: 0, width: cell.frame.width/2, height: cell.frame.height))
        label1.text = locationName
        label2.text = matchDate
        cell.addSubview(label1)
        cell.addSubview(label2)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let indexPath = tableView.indexPathForSelectedRow!
        //let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        
        //let currentGroupName = currentCell.textLabel?.text
        
        /*for i in allGroups {
            if ( i.name == currentGroupName )
            {
                groupToPass = i
            }
        }*/
        //var secondVC = GroupPageController()
        performSegue(withIdentifier: "presentRound" , sender: self )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //roundTableView.reloadData()
        // Do any additional setup after loading the view.
        roundList = loadRounds()!

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
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
