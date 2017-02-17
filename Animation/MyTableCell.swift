//
//  MyTableCell.swift
//  Animation
//
//  Created by Melaniia Hulianovych on 2/17/17.
//  Copyright © 2017 Melaniia Hulianovych. All rights reserved.
//

import UIKit

class MyTableCell: UITableViewCell {

    @IBOutlet weak var resizedCell: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool){
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
