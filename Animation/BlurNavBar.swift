//
//  BlurNavBar.swift
//  Animation
//
//  Created by Melaniia Hulianovych on 2/10/17.
//  Copyright © 2017 Melaniia Hulianovych. All rights reserved.
//

import UIKit

class BlurNavBar: UIView {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.bounds = frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        setupDisclosureIndicator()
        
        // Set color for autodetected hyperlinks
//        richTextView?.tintColor = COConfigValues.Colors.text()
    }
    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
//    override func draw(_ rect: CGRect) {
//
//    }

}
