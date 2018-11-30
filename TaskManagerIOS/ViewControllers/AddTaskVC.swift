//
//  AddTaskVC.swift
//  TaskManagerIOS
//
//  Created by Briley Barron on 11/28/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import UIKit

class AddTaskVC: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var prioritySegmentedController: UISegmentedControl!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))

    }
    
    @IBAction func addButtonTapped(_ sender: Any) {//if the add button is tapped then check to see if the name is there
        guard let title = nameTextField.text, title != "" else {
            return
        }
        
        let dateFormatter = DateFormatter()//then format the date in the date picker
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        let dueDate = datePicker.date
        let priorityIndex = prioritySegmentedController.selectedSegmentIndex//find the index of the segmented controller
        let priority: Priority
        switch priorityIndex {//then switch on the priority
        case 0:
            priority = .low
        case 1:
            priority = .medium
        default:
            priority = .high
        }
        
        Library.library.library.append(Task(name: title, description: descriptionTextView.text, completed: .notComplete(due: dueDate), priority: priority))//create the task
        
        print(Library.library.library)
        
        performSegue(withIdentifier: "unwindToAllFromAdd", sender: self)//then unwind the segue back to view all the tasks
    
    }
}
