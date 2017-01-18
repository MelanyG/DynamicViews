//
//  RoundedView.swift
//  Animation
//
//  Created by Melaniia Hulianovych on 1/12/17.
//  Copyright © 2017 Melaniia Hulianovych. All rights reserved.
//

import UIKit


@IBDesignable
class RoundedView: UIView {

    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        layer.masksToBounds = true
       layer.borderWidth = 10.0
        layer.borderColor = UIColor(colorLiteralRed: 0.0, green: 64/255.0, blue: 128/255.0, alpha: 1.0).cgColor
        layer.cornerRadius = 20.0
        
        let startColor = UIColor(colorLiteralRed: 102/255.0, green: 204/255.0, blue: 1.0, alpha: 1.0).cgColor
        let endColor = UIColor(colorLiteralRed: 0.0, green: 128/255.0, blue: 1.0, alpha: 1.0).cgColor
        gradientLayer.colors = [startColor, endColor]
    }


}
