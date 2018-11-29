//
//  IncompleteTasksVC.swift
//  TaskManagerIOS
//
//  Created by Briley Barron on 11/28/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import UIKit

class IncompleteTasksVC: UIViewController {
    @IBOutlet weak var incompleteTasksTableView: UITableView!
    @IBOutlet weak var incompleteSearchBar: UISearchBar!
    
    var editedTasks = Library.library.notComplete
    var textEdited = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
extension IncompleteTasksVC: UISearchBarDelegate {
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            let search = searchText.lowercased().replacingOccurrences(of: " ", with: "-")
            var tempArray = [Task]()
            
            
            if search == "" {
                // display everything
                textEdited = editedTasks
                tempArray = []
            } else {
                
                
                
                for name in editedTasks {
                    if name.name.contains(search) {
                        print(name)
                        tempArray.append(name)
                    }
                }
                
                textEdited.removeAll()
                textEdited.append(contentsOf: tempArray)
                tempArray.removeAll()
            }
            
            incompleteTasksTableView.reloadData()
        }
    }

extension IncompleteTasksVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return editedTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "incompleteTaskCell") as! TaskCell
        
        cell.task = editedTasks[indexPath.row]
        cell.nameLabel.text = editedTasks[indexPath.row].name
        cell.setup()
        return cell
    }
    
    
}
