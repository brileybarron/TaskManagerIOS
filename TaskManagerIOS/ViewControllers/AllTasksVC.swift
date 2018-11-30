//
//  AllTasksVC.swift
//  TaskManagerIOS
//
//  Created by Briley Barron on 11/26/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import UIKit

class AllTasksVC: UIViewController {
    @IBOutlet weak var allTasksTableView: UITableView!
    
    var chosenCell: TaskCell?//stores the cell that is chosen so that the prepare is made easier
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {//everytime the view is pulled up then reload the data in the cells
        print(Library.library.library)
        allTasksTableView.reloadData()
    }
    
    @IBAction func unwindToAll (segue: UIStoryboardSegue) {} //unwind segue
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is DetailsVC {//check if the destination is the DetailsVC then send over the chosen cell's task to be displayed
            let destination = segue.destination as! DetailsVC
            destination.task = chosenCell!.task
        }
    }
    
    func complete(indexPath: IndexPath) { //function used to update the actions
        let task = Library.library.library[indexPath.row]
        task.completed = .complete //changes the completion to completed
        (allTasksTableView.cellForRow(at: indexPath) as! TaskCell).setup()
    }

    
    func incomplete(indexPath: IndexPath) { //function used to update the actions
        let task = Library.library.library[indexPath.row]
        if let date = task.date {
            task.completed = .notComplete(due: date) //set the completion to not complete
            (allTasksTableView.cellForRow(at: indexPath) as! TaskCell).setup()
        }
    }
}


extension AllTasksVC: UITableViewDelegate, UITableViewDataSource { //for the Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Library.library.library.count//for the number of cells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskCell
        cell.nameLabel.text = Library.library.library[indexPath.row].name//set the name of the cell
        cell.task = Library.library.library[indexPath.row]//and the task stored in the cell
        cell.setup()//then does the color of the cell
        return cell//then adds the cell to the table view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {//if a cell is selected
        chosenCell = tableView.cellForRow(at: indexPath) as? TaskCell
        
        performSegue(withIdentifier: "toDetails", sender: tableView.cellForRow(at: indexPath))//then perform this segue
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {//this allows the cells to have actions
        //adds a new choice when the cell is swiped
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            Library.library.library.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        }
        
        let task = Library.library.library[indexPath.row]
        
        // If the task is complete, we create and return the incomplete action.
        // If the task is not complete, we create and return the complete action.
        
        switch task.completed {
        case .complete:
            let checkOutAction = UITableViewRowAction(style: .normal, title: "Not Complete") { _, indexPath in
                
                self.incomplete(indexPath: indexPath)
                tableView.reloadData()
            }
            
            return [deleteAction, checkOutAction]
            
        case .notComplete(due: _):
            let checkInAction = UITableViewRowAction(style: .normal, title: "Complete") { _, indexPath in
                self.complete(indexPath: indexPath)
                tableView.reloadData()
            }
            
            return [deleteAction, checkInAction]
            
        }
    }
    
    
}
