//
//  TaskCell.swift
//  TaskManagerIOS
//
//  Created by Briley Barron on 11/26/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    var task = Task(name: "a", description: "b", completed: .complete, priority: .high)//store a task

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup () { //when the cell is made change the color based on the priority
        switch task.priority {
        case .high://red for things that are urgent
            self.backgroundColor = UIColor(red: 255/255, green: 0, blue: 0, alpha: 1)
        case .medium://yellow for things that may need attention soon but not urgent
            self.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 0, alpha: 1)
        case .low://green for things that are good for now.
            self.backgroundColor = UIColor(red: 0, green: 255/255, blue: 0, alpha: 1)
        }
    }

}
