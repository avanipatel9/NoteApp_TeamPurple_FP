//
//  NoteCellTableViewCell.swift
//  NoteApp_TeamPurple_FP
//
//  Created by Avani Patel on 6/24/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import UIKit

class NoteCellTableViewCell: UITableViewCell {

   
    @IBOutlet weak var notesTitle: UILabel!
    @IBOutlet weak var notesDate: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
