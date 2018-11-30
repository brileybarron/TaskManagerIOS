//
//  TaskLibrary.swift
//  TaskManagerIOS
//
//  Created by Briley Barron on 11/26/18.
//  Copyright © 2018 Briley Barron. All rights reserved.
//

import Foundation

class Library {
    static var library = Library()//singleton
    
    //stores three arrays
    
    var library = [Task]() //one with all the tasks
    
    var completed: [Task] {//one for only completed tasks
        var tempArray = [Task]()
        for task in library {
            if task.completed.isComplete {
                tempArray.append(task)
            }
        }
        return tempArray
    }
    
    var notComplete: [Task]{//one for only incomplete tasks
        var tempArray = [Task]()
        for task in library {
            if !task.completed.isComplete {
                tempArray.append(task)
            }
        }
        return tempArray
    }
    
}
