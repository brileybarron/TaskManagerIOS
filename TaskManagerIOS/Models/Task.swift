//
//  Task.swift
//  TaskManagerIOS
//
//  Created by Briley Barron on 11/26/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import Foundation
import UIKit

class Task {//each task needs at least a name, description, completed, and priority
    var name: String
    var description: String
    var completed: complete
    var priority: Priority
    var date: Date?
    
    init (name: String, description: String, completed: complete, priority: Priority) {
        //initializer
        self.name = name
        self.description = description
        self.completed = completed
        self.priority = priority
        switch self.completed {
        case .complete://if the task is complete then there is no need to give it a date
            self.date = nil
        case .notComplete(due: let dueDate):
            self.date = dueDate
        }
    }
}



enum Priority {//priority enum
    case high
    case medium
    case low
}

enum complete {//complettion enum
    case notComplete(due: Date)
    case complete
    
    var isComplete: Bool {//also stores a boolean value
        switch self {
        case .notComplete(due: _):
            return false
        case . complete:
            return true
        }
    }
}


extension Task: Equatable {//allows for comparison between two tasks
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.name == rhs.name && lhs.description == rhs.description &&  lhs.priority == rhs.priority && lhs.completed.isComplete == rhs.completed.isComplete
    }
}
