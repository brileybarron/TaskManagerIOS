//
//  Task.swift
//  TaskManagerIOS
//
//  Created by Briley Barron on 11/26/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import Foundation
import UIKit

class Task {
    var name: String
    var description: String
    var completed: complete
    var priority: Priority
    var date: Date?
    
    init (name: String, description: String, completed: complete, priority: Priority) {
        self.name = name
        self.description = description
        self.completed = completed
        self.priority = priority
        switch self.completed {
        case .complete:
            self.date = nil
        case .notComplete(due: let dueDate):
            self.date = dueDate
        }
    }
}



enum Priority {
    case high
    case medium
    case low
    
    var color: UIColor {
        switch self {
        case .high:
            return UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        case .medium:
            return UIColor(red: 1, green: 1, blue: 0, alpha: 1)
        case .low:
            return UIColor(red: 0, green: 1, blue: 0, alpha: 1)
        }
    }
}

enum complete {
    case notComplete(due: Date)
    case complete
    
    var isComplete: Bool {
        switch self {
        case .notComplete(due: _):
            return false
        case . complete:
            return true
        }
    }
}


extension Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.name == rhs.name && lhs.description == rhs.description &&  lhs.priority == rhs.priority && lhs.completed.isComplete == rhs.completed.isComplete
    }
}
