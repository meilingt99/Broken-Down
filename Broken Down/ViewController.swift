//
//  ViewController.swift
//  Broken Down
//
//  Created by Meiling Thompson on 7/27/19.
//  Copyright © 2019 Meiling Thompson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var taskTableView: UITableView!
    
    var dailyTasks = [
        Task(name: "Complete 1 CtCI Problem", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Complete 1 HR/LC Problem", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Daily Workout", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Work on CBE for 20 minutes", type: .daily, completed: false, lastCompleted: nil),
    ]
    
    var weeklyTasks = [
        Task(name: "Do Laundry", type: .weekly, completed: false, lastCompleted: nil),
        Task(name: "Clean Room", type: .weekly, completed: true, lastCompleted: nil),
        Task(name: "Check Finances", type: .weekly, completed: false, lastCompleted: nil),
    ]
    
    var toDos = [
        Task(name: "W2W: Get Map on Homepage", type: .todo, completed: false, lastCompleted: nil ),
        Task(name: "W2W: Add SS Page", type: .todo, completed: false, lastCompleted: nil ),
        Task(name: "iOS Part 10", type: .todo, completed: false, lastCompleted: nil ),
    ]
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected row \(indexPath.row) in section \(indexPath.section)")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        tableView.backgroundColor = UIColor.clear
        return 3
    }
    
    @IBAction func ToggleNightMode(_ sender: Any) {
        let mySwitch = sender as! UISwitch
        if mySwitch.isOn {
            view.backgroundColor = UIColor.darkGray
        } else {
            view.backgroundColor = UIColor.white
        }
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
    
    @IBAction func resetList(_ sender: Any) {
        print("resetting list")
        let confirm = UIAlertController(title: "Reset Tasks", message: "Reset List?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .destructive) {
            action in
            for i in 0..<self.dailyTasks.count {
                self.dailyTasks[i].completed = false
            }
            for i in 0..<self.weeklyTasks.count {
                self.weeklyTasks[i].completed = false
            }
            for i in 0..<self.toDos.count {
                self.toDos[i].completed = false
            }
            self.taskTableView.reloadData()
        }
        let noAction = UIAlertAction(title: "No", style: .cancel) {
            action in
            print("Reset cancelled")
        }
        
        //add actions to alert controller
        confirm.addAction(yesAction)
        confirm.addAction(noAction)
        //show alert controller
        present(confirm, animated: true, completion: nil)
    }
    
    
    /** @IBAction func resetList(_ sender: Any) {
        print("resetting list")
        for i in 0..<self.dailyTasks.count {
            self.dailyTasks[i].completed = false
        }
        for i in 0..<self.weeklyTasks.count {
            self.dailyTasks[i].completed = false
        }
        for i in 0..<self.toDos.count {
            self.dailyTasks[i].completed = false
        }
        self.taskTableView.reloadData()
        print("reset entered")
        let confirm = UIAlertController(title: "Reset Tasks", message: "Reset List?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .destructive) {
            action in
            for i in 0..<self.dailyTasks.count {
                self.dailyTasks[i].completed = false
            }
            for i in 0..<self.weeklyTasks.count {
                self.dailyTasks[i].completed = false
            }
            for i in 0..<self.toDos.count {
                self.dailyTasks[i].completed = false
            }
            self.taskTableView.reloadData()
        }
        let noAction = UIAlertAction(title: "No", style: .cancel) {
            action in
            print("Reset cancelled")
        }
        
        //add actions to alert controller
        confirm.addAction(yesAction)
        confirm.addAction(noAction)
        //show alert controller
        present(confirm, animated: true, completion: nil)
    } **/
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let completeAction = UIContextualAction(style: .normal, title: "Complete") { (action: UIContextualAction, sourceView: UIView, actionPerformed: (Bool) -> Void) in
            switch indexPath.section {
            case 0:
                self.dailyTasks[indexPath.row].completed = true
            case 1:
                self.weeklyTasks[indexPath.row].completed = true
            case 2:
                self.toDos[indexPath.row].completed = true
            default:
                break
            }
            tableView.reloadData()
            actionPerformed(true)
        }
        return UISwipeActionsConfiguration(actions: [completeAction])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var currentTask: Task!
        switch indexPath.section {
        case 0:
            currentTask = dailyTasks[indexPath.row]
        case 1:
            currentTask = weeklyTasks[indexPath.row]
        case 2:
            currentTask = toDos[indexPath.row]
        default:
            cell.textLabel?.text = "This should never happen"
        }
        cell.textLabel?.text = currentTask.name
        if currentTask.completed {
            cell.textLabel?.textColor = UIColor.lightGray
            cell.accessoryType = .checkmark
        } else {
            cell.textLabel?.textColor = UIColor.black
            cell.accessoryType = .none
        }
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).backgroundView?.backgroundColor = UIColor.clear
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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

