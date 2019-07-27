//
//  ViewController.swift
//  Broken Down
//
//  Created by Meiling Thompson on 7/27/19.
//  Copyright © 2019 Meiling Thompson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected row \(indexPath.row) in section \(indexPath.section)")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dailyTasks.count
        case 1:
            return weeklyTasks.count
        case 2:
            return toDos.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = dailyTasks[indexPath.row]
        case 1:
            cell.textLabel?.text = weeklyTasks[indexPath.row]
        case 2:
            cell.textLabel?.text = toDos[indexPath.row]
        default:
            cell.textLabel?.text = "This should never happen"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Daily Tasks"
        case 1:
            return "Weekly Tasks"
        case 2:
            return "To Dos"
        default:
            return nil
        }
    }
    
    
    
    let dailyTasks = ["Complete 1 CtCI Problem",
                      "Complete 1 HR/LC Problem",
                      "Daily Workout",
                      "Work on CBE for 20 mins"]
    
    let weeklyTasks = ["Do Laundry",
                       "Clean Room",
                       "Check Finances"]
    
    let toDos = ["W2W: Get Map on Homepage",
                 "W2W: Add SS Page",
                 "iOS Part 5"]

    @IBAction func nightMode(_ sender: Any) {
        if view.backgroundColor == UIColor.darkGray {
            view.backgroundColor = UIColor.white
            let everything = view.subviews
            for eachView in everything {
                if eachView is UILabel {
                    let currentLabel = eachView as! UILabel
                    currentLabel.textColor = UIColor.black
                }
            }
        }
        else {
            view.backgroundColor = UIColor.darkGray
            let everything = view.subviews
            for eachView in everything {
                if eachView is UILabel {
                    let currentLabel = eachView as! UILabel
                    currentLabel.textColor = UIColor.lightGray
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

