//
//  ToDoListTableViewCell.swift
//  To-Do-List
//
//  Created by Liam Leahy on 10/10/15.
//  Copyright © 2015 Liam Leahy. All rights reserved.
//

import UIKit

class ToDoListTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
