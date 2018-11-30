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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CompletedTaskVC: UITableViewDelegate, UITableViewDataSource {//gives a table view with only the completed tasks
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Library.library.completed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "completedTaskCell") as! TaskCell
        
        cell.task = Library.library.completed[indexPath.row]
        cell.nameLabel.text = Library.library.completed[indexPath.row].name
        cell.setup()
        cell.isUserInteractionEnabled = false
        return cell
    }
    
    
}
