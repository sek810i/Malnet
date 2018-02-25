//
//  MessageCell.swift
//  MalNet
//
//  Created by Oleg Bogdan on 16.08.17.
//  Copyright © 2017 Богдан Олег. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    @IBOutlet weak var malnetImageCloud: UIImageView!

    @IBOutlet weak var malnetTextMessage: UILabel!

    @IBOutlet weak var userImageCloud: UIImageView!
    
    @IBOutlet weak var userTextMessage: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
