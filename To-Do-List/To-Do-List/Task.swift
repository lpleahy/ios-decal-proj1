//
//  Task.swift
//  To-Do-List
//
//  Created by Liam Leahy on 10/10/15.
//  Copyright © 2015 Liam Leahy. All rights reserved.
//

import UIKit

class Task {
    
    let taskName: String
    let dateCreated: NSDate
    
    init?(taskName: String) {
        self.taskName = taskName
        self.dateCreated = NSDate()
        
        if taskName.isEmpty {
            return nil
        }
    }
}
