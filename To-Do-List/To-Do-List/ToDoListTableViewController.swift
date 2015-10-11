//
//  ToDoListTableViewController.swift
//  To-Do-List
//
//  Created by Liam Leahy on 10/10/15.
//  Copyright © 2015 Liam Leahy. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    var tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleData()
    }
    
    func loadSampleData() {
        let taskOne = Task(taskName: "Label 1")!
        let taskTwo = Task(taskName: "Label 2")!
        
        tasks += [taskOne, taskTwo]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let taskIdentifier = "ToDoListTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(taskIdentifier, forIndexPath: indexPath) as! ToDoListTableViewCell
        let task = tasks[indexPath.row]
        cell.cellLabel.text = task.taskName
        return cell
    }
    
    @IBAction func unwindToTaskList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? AddTaskViewController, task = sourceViewController.task {
            let newIndexPath = NSIndexPath(forRow: tasks.count, inSection: 0)
            tasks.append(task)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
        }
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail" {
            let taskDetailViewController = segue.destinationViewController as! AddTaskViewController
            if let selectedTask = sender as? ToDoListTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedTask)!
                let selectedTask = tasks[indexPath.row]
                taskDetailViewController.task = selectedTask
            }
        } else if segue.identifier == "AddItem" {
            print("Adding a new task...")
        }
    }
    
}
