//
//  UIImageViewExtension.swift
//  Animation
//
//  Created by Melaniia Hulianovych on 2/23/17.
//  Copyright © 2017 Melaniia Hulianovych. All rights reserved.
//

import UIKit

extension  UIImageView {

    public func setupWithProgress(percent:CGFloat, textToDraw text:String, fontSizeToSet fontSize:CGFloat, fontColor textColor:UIColor) {
        
        var whiteImage = UIImage.drawTextImage(withColor: UIColor.white, withText: text, withSize: fontSize, inRect:self.bounds)
        let grayImage = UIImage.drawTextImage(withColor: textColor, withText: text, withSize: fontSize, inRect:self.bounds)
        
        let cropWidth = self.bounds.size.width * percent
        if percent == 0 {
            whiteImage = grayImage
        } else {
            whiteImage = whiteImage.crop(toRect: CGRect(x: 0.0, y: 0.0, width: cropWidth, height: whiteImage.size.height))!
        }
        
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: grayImage.size.width, height: grayImage.size.height), false, 4.0)
        grayImage.draw(in: CGRect(x: 0.0, y: 0.0, width: grayImage.size.width, height: grayImage.size.height))
        whiteImage.draw(in: CGRect(x: 0.0, y: 0.0, width: cropWidth, height: grayImage.size.height))
        
        let combinedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let frameOne = CGRect(origin: CGPoint.zero, size: CGSize(width: self.bounds.size.width, height: self.bounds.size.height))
        let frameTwo = CGRect(origin: CGPoint.zero, size: CGSize(width: cropWidth, height: self.bounds.size.height))
        let rectIm = UIImage.drawTwoRectangles(frameOne, frameTwo: frameTwo, frameColor: textColor)
        
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0.0)
        
        rectIm.draw(in: self.bounds)
        combinedImage?.draw(in:CGRect(x: 0, y: self.bounds.size.height / 2 - fontSize / 2, width: self.bounds.size.width, height: self.bounds.size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.image = newImage
    }

}
