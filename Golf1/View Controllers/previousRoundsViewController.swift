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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //From batchExport doc
    
    func numberOfSections(in TableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //roundTableView.reloadData()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        roundTableView.allowsMultipleSelection = true
    }
    
    //table view will return int for how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roundList.count
    }
    
    //what is in the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let locationName  = roundList[indexPath.row].location
        let matchDate = roundList[indexPath.row].date
        var pracOrComp:String {
            if roundList[indexPath.row].isPracticeRound{
                return "P"
            }
            return "C"
        }
        
        var holes:String {
            if roundList[indexPath.row].holesPlayed{
                return "18"
            }
            return "9"
        }
        
        let label1 = UILabel(frame: CGRect(x: 30, y: 0, width: cell.frame.width/2, height: cell.frame.height))
        let label2 = UILabel(frame: CGRect(x: cell.frame.width/2, y: 0, width: cell.frame.width/2 - 100, height: cell.frame.height))
        label1.text = "\(locationName) \(matchDate)"
        label2.text = "\(pracOrComp) \(holes)"
        label2.textAlignment = .right
        cell.addSubview(label1)
        cell.addSubview(label2)
        
        cell.accessoryType = .detailButton
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        //Index value is manually set to 1 because the index value pressed on the table view is stored here
        round = roundList[(indexPath?[1])!]
        performSegue(withIdentifier: "showRound" , sender: self )
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
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let cell = roundTableView.cellForRow(at: indexPath)
        
        //select/unselect cell
        cell!.isSelected = !cell!.isSelected
        if cell!.isSelected {
            roundTableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.none)
        }
        else {
            roundTableView.deselectRow(at: indexPath, animated: false)
        }
    }
    
    @IBAction func exportBatch(_ sender: UIButton) {
        print("function called")
        if roundTableView.indexPathsForSelectedRows == nil {
            presentAlert()
            return
        }
        //compile rounds
        var selectedRounds = [Round]()
        for indexPath in roundTableView.indexPathsForSelectedRows!{
            selectedRounds.append(allRounds[indexPath.row])
        }
        //export
        let csvString = convertToCSV(roundArray: selectedRounds)
        print(csvString)
        //Save file info
        let fileName = "Rounds Batch Export.csv"
        let path = NSURL(fileURLWithPath:NSTemporaryDirectory()).appendingPathComponent(fileName)
        
        //save the round csv file
        do {
            try csvString.write(to: path!, atomically: true, encoding: String.Encoding.utf8)
        }
        catch {
            print("Failed to create file")
            print("\(error)")
        }
        
        //create activity popover
        let activityView = UIActivityViewController(activityItems: [path!], applicationActivities:[])
        //modify activities
        activityView.excludedActivityTypes = [UIActivityType.assignToContact,UIActivityType.assignToContact,UIActivityType.saveToCameraRoll,UIActivityType.postToFlickr,UIActivityType.postToVimeo,UIActivityType.postToTencentWeibo,UIActivityType.postToTwitter,UIActivityType.postToFacebook,UIActivityType.openInIBooks]
        //present popover
        activityView.modalPresentationStyle = UIModalPresentationStyle.popover
        present(activityView, animated: true, completion: nil)
    }
    
    func presentAlert() {
        let alert = UIAlertController(title: "Export Failed", message: "No rounds were selected. Please select rounds before exporting", preferredStyle: UIAlertControllerStyle.alert)
        let OKAction = UIAlertAction(title: "OK", style: .cancel) { action in
            // ...
        }
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}
