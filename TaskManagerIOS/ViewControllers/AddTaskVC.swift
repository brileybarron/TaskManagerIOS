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
    
    var tasks = Library.library.library
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))

    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
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
        
        Library.library.library.append(Task(name: title, description: descriptionTextView.text, completed: .notComplete(due: dueDate), priority: priority))
        
        print(Library.library.library)
        
        performSegue(withIdentifier: "unwindToAllFromAdd", sender: self)
    
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
