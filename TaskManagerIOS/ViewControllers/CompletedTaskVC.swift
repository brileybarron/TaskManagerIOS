//
//  CompletedTaskViewController.swift
//  TaskManagerIOS
//
//  Created by Briley Barron on 11/28/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import UIKit

class CompletedTaskVC: UIViewController {
    @IBOutlet weak var completedTasksTableView: UITableView!
    @IBOutlet weak var completedSearchBar: UISearchBar!
    
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

extension CompletedTaskVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Library.library.completed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "completedTaskCell") as! TaskCell
        
        cell.task = Library.library.completed[indexPath.row]
        cell.nameLabel.text = Library.library.completed[indexPath.row].name
        cell.setup()
        return cell
    }
    
    
}
