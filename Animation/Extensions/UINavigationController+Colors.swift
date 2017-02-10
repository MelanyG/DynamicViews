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
        static var DescriptiveBarName = "barCustom"
    }
    
       var navigationBlurBar: BlurNavBar? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.DescriptiveBarName) as? BlurNavBar
        }
        
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(
                    self,
                    &AssociatedKeys.DescriptiveBarName,
                    newValue as BlurNavBar?,
                    .OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
            }
        }
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
    
    func styleNavBar(color:UIColor, setTitle title:String) {
        self.setNavigationBarHidden(true, animated: false)
        if navigationBlurBar == nil {
            //Get all views in the xib
            navigationBlurBar = Bundle.main.loadNibNamed("BlurNavBar", owner: self, options: nil)?.first as? BlurNavBar
        }
        if self.viewControllers.count > 1 {
            navigationBlurBar?.backButton.isHidden = false
            navigationBlurBar?.backButton.addTarget(self, action: #selector(UINavigationController.backButtonPressed), for: UIControlEvents.touchUpInside)
        } else {
            navigationBlurBar?.backButton.isHidden = true
        }
        navigationBlurBar?.frame = CGRect(x: 0.0, y: 0.0, width: view.bounds.size.width, height: 64.0)
        navigationBlurBar?.backgroundColor = color
        self.view.addSubview(navigationBlurBar!)
    }
    
    func backButtonPressed() {
        self.popViewController(animated: true)
    }
}
