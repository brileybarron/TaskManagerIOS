//
//  TaskLibrary.swift
//  TaskManagerIOS
//
//  Created by Briley Barron on 11/26/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import Foundation

class Library {
    static var library = Library()
    
    var library = [Task]()
    
    var completed: [Task] {
        var tempArray = [Task]()
        for task in library {
            if task.completed.isComplete {
                tempArray.append(task)
            }
        }
        return tempArray
    }
    
    var notComplete: [Task]{
        var tempArray = [Task]()
        for task in library {
            if !task.completed.isComplete {
                tempArray.append(task)
            }
        }
        return tempArray
    }
    
}
