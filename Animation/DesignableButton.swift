//
//  DesignableButton.swift
//  Animation
//
//  Created by Melaniia Hulianovych on 1/18/17.
//  Copyright © 2017 Melaniia Hulianovych. All rights reserved.
//

import UIKit

@IBDesignable class DesignableButton: UIButton {
    @IBInspectable var borderColor: UIColor = UIColor.red {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 10 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 50 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var makeCircular: Bool = false {
        didSet {
            makeCircular = true
            layer.cornerRadius = min(bounds.width, bounds.height) / 2.0
            print(layer.cornerRadius)
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
