//
//  homeCellTableViewCell.swift
//  DVHacks
//
//  Created by Bobby Zhang on 2018-04-14.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit

class homeCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postCaption: UILabel!
    
    
    @IBOutlet weak var postPeople: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
