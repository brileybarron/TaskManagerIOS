//
//  EditTaskVC.swift
//  TaskManagerIOS
//
//  Created by Briley Barron on 11/28/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import UIKit

class EditTaskVC: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var prioritySegmentedController: UISegmentedControl!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var fixButton: UIBarButtonItem!
    
    
    var task = Task(name: "a", description: "b", completed: .complete, priority: .high)
    override func viewDidLoad() {//when the view loads in then set all; the labels to values based on the task chosen in the previous screen
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nameTextField.text = task.name
        descriptionTextView.text = task.description
        switch task.priority {
        case .low:
            prioritySegmentedController.selectedSegmentIndex = 0
        case .medium:
            prioritySegmentedController.selectedSegmentIndex = 1
        case .high:
            prioritySegmentedController.selectedSegmentIndex = 2
        }
        switch task.completed {//this will determine if the task is completed or not.  If it is then the date picker is hidden.  if the task is not complete then the date picker's starting date is the due date
        case .complete:
            datePicker.isHidden = true
            dateLabel.isHidden = true
        case .notComplete(due: let dueDate):
            datePicker.setDate(dueDate, animated: true)
        }
    }
    
    @IBAction func fixButtonTapped(_ sender: Any) {//this button will delete the old task and replace it with a new one
        var count = 0
        
        guard let title = nameTextField.text, title != "" else {
            return
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        let dueDate = datePicker.date
        let priorityIndex = prioritySegmentedController.selectedSegmentIndex
        let priority: Priority
        switch priorityIndex {
        case 0:
            priority = .low
        case 1:
            priority = .medium
        default:
            priority = .high
        }
        for items in Library.library.library {
            if items == task {
                Library.library.library.remove(at: count)
                if task.completed.isComplete {
                    Library.library.library.append(Task(name: title, description: descriptionTextView.text, completed: .complete, priority: priority))
                    print("task is complete")
                } else {
                    Library.library.library.append(Task(name: title, description: descriptionTextView.text, completed: .notComplete(due: dueDate), priority: priority))
                    print("task is not complete")
                }
                
                performSegue(withIdentifier: "toAll", sender: self)
            }
            count += 1
        }
    }
}
