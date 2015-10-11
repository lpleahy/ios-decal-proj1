//
//  Task.swift
//  To-Do-List
//
//  Created by Liam Leahy on 10/10/15.
//  Copyright © 2015 Liam Leahy. All rights reserved.
//

import UIKit

class Task: NSObject, NSCoding {
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("tasks")
    
    struct PropertyKey {
        static let nameKey = "name"
        static let dateKey = "date"
        static let isCheckedKey = "checked"
    }
    
    var taskName: String
    var dateCreated: NSDate
    var isChecked = false
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(taskName, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(dateCreated, forKey: PropertyKey.dateKey)
        aCoder.encodeObject(isChecked, forKey: PropertyKey.isCheckedKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let dateCreated = aDecoder.decodeObjectForKey(PropertyKey.dateKey) as! NSDate
        let checked = aDecoder.decodeObjectForKey(PropertyKey.isCheckedKey) as! Bool
        self.init(taskName: name, dateCreated: dateCreated, isChecked: checked)
    }
    
    init?(taskName: String) {
        self.taskName = taskName
        self.dateCreated = NSDate()
        self.isChecked = false
        
        super.init()
        
        if taskName.isEmpty {
            return nil
        }
    }
    
    init?(taskName: String, dateCreated: NSDate, isChecked: Bool) {
        self.taskName = taskName
        self.dateCreated = dateCreated
        self.isChecked = isChecked
        
        super.init()
        
        if taskName.isEmpty {
            return nil
        }
    }
}
