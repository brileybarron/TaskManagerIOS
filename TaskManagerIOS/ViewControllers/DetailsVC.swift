//
//  DetailsVC.swift
//  TaskManagerIOS
//
//  Created by Briley Barron on 11/28/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var completedLabel: UILabel!
    
    var task = Task(name: "a", description: "b", completed: .complete, priority: .low)
    
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
