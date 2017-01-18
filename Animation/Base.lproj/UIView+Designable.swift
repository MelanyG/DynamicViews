//
//  UIView+Designable.swift
//  Animation
//
//  Created by Melaniia Hulianovych on 1/17/17.
//  Copyright © 2017 Melaniia Hulianovych. All rights reserved.
//

import UIKit

//@IBDesignable class DesignableImageView: UIImageView {}
//@IBDesignable class DesignableButton: UIButton {
//    @IBInspectable var borderColor: UIColor = UIColor.redColor() {
//        didSet {
//            layer.borderColor = borderColor.CGColor
//        }
//    }
//    
//    @IBInspectable var borderWidth: CGFloat = 10 {
//        didSet {
//            layer.borderWidth = borderWidth
//        }
//    }
//    
//    @IBInspectable var cornerRadius: CGFloat = 15 {
//        didSet {
//            layer.cornerRadius = cornerRadius
//        }
//    }
//    
//    @IBInspectable var makeCircular: Bool = true {
//        didSet {
//            makeCircular = makeCircular
//            layer.cornerRadius = min(bounds.width, bounds.height) / 2.0
//        }
//    }
//}
//@IBDesignable class DesignableTextField: UITextField {
//
//    @IBInspectable
//    var placeholderTextColor: UIColor = UIColor.lightGrayColor() {
//        didSet {
//            guard let placeholder = placeholder else {
//                return
//            }
//            attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSForegroundColorAttributeName: placeholderTextColor])
//        }
//    }
//    @IBInspectable var borderColor: UIColor = UIColor.redColor() {
//        didSet {
//            layer.borderColor = borderColor.CGColor
//        }
//    }
//    
//    @IBInspectable var borderWidth: Float = 10 {
//        didSet {
//            layer.borderWidth = borderWidth
//        }
//    }
//    
//    @IBInspectable var cornerRadius: Float = 15 {
//        didSet {
//            layer.cornerRadius = cornerRadius
//        }
//    }
//
//}


extension UIView {

    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set(newBorderWidth) {
            layer.borderWidth = newBorderWidth
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            return layer.borderColor != nil ? UIColor(cgColor: layer.borderColor!) : nil
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var cornerRadious: Float {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue != 0
        }
    }
    
    @IBInspectable
    var makeCircular: Bool? {
        get {
            return nil
        }
        set {
            if let makeCircular = newValue, makeCircular {
                cornerRadius = min(bounds.width, bounds.height) / 2.0
            }
        }
    }
}
