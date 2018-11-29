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
    override func viewDidLoad() {
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
        switch task.completed {
        case .complete:
            datePicker.isHidden = true
            dateLabel.isHidden = true
        case .notComplete(due: let dueDate):
            datePicker.setDate(dueDate, animated: true)
        }
    }
    
    @IBAction func fixButtonTapped(_ sender: Any) {
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

//        Library.library.library.append(Task(name: title, description: descriptionTextView.text, completed: taskCompleted, priority: priority))
//        
//        performSegue(withIdentifier: "toAll", sender: self)
        
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
