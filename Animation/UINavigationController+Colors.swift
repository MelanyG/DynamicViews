//
//  UINavigationController+Colors.swift
//  Animation
//
//  Created by Melaniia Hulianovych on 2/1/17.
//  Copyright © 2017 Melaniia Hulianovych. All rights reserved.
//

import UIKit

extension UINavigationController {
    private struct AssociatedKeys {
        static var DescriptiveName = "custom"
    }
    
    var parentPath: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.DescriptiveName) as? String
        }
        
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(
                    self,
                    &AssociatedKeys.DescriptiveName,
                    newValue as NSString?,
                    .OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
            }
        }
    }
}
