//
//  AllTasksVC.swift
//  TaskManagerIOS
//
//  Created by Briley Barron on 11/26/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import UIKit

class AllTasksVC: UIViewController {
    @IBOutlet weak var allTasksSearch: UISearchBar!
    @IBOutlet weak var allTasksTableView: UITableView!
    
    var chosenCell: TaskCell?
    
    let allTasks = Library.library.library
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(Library.library.library)
        allTasksTableView.reloadData()
    }
    
    @IBAction func unwindToAll (segue: UIStoryboardSegue) {}
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is DetailsVC {
            let destination = segue.destination as! DetailsVC
            destination.task = chosenCell!.task
        }
    }
    
    func complete(indexPath: IndexPath) {
        let task = Library.library.library[indexPath.row]
        task.completed = .complete
        (allTasksTableView.cellForRow(at: indexPath) as! TaskCell).setup()
    }

    
    func incomplete(indexPath: IndexPath) {
        let task = Library.library.library[indexPath.row]
        if let date = task.date {
            task.completed = .notComplete(due: date)
            (allTasksTableView.cellForRow(at: indexPath) as! TaskCell).setup()
        }
    }
    
    
//    func checkOut(at indexPath: IndexPath) {//gives the check
//        let game = self.library.games[indexPath.row]
//
//        let calendar = Calendar(identifier: .gregorian)
//        let dueDate = calendar.date(byAdding: .day, value: 7, to: Date())!
//
//        game.avaliability = .checkedOut(dueDate: dueDate)
//        (tableView.cellForRow(at: indexPath) as! LibraryCell).setup()
//    }
//
//    func checkIn(at indexPath: IndexPath) {
//        let game = self.library.games[indexPath.row]
//        game.avaliability = .checkedIn
//        (tableView.cellForRow(at: indexPath) as! LibraryCell).setup()
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AllTasksVC: UISearchBarDelegate{
    
}

extension AllTasksVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Library.library.library.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskCell
        cell.nameLabel.text = Library.library.library[indexPath.row].name
        cell.task = Library.library.library[indexPath.row]
        cell.setup()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenCell = tableView.cellForRow(at: indexPath) as? TaskCell
        
        performSegue(withIdentifier: "toDetails", sender: tableView.cellForRow(at: indexPath))
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //adds a new choice when the cell is swiped
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            Library.library.library.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        }
        
        let task = Library.library.library[indexPath.row]
        
        // If the task is complete, we create and return the completed action.
        // If the task is not complete, we create and return the incomplete action.
        
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
