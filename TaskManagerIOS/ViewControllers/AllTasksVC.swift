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
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenCell = tableView.cellForRow(at: indexPath) as? TaskCell
        
        performSegue(withIdentifier: "toDetails", sender: tableView.cellForRow(at: indexPath))
        
    }
    
    
}
