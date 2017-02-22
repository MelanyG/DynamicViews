//
//  UIImageExtension.swift
//  Animation
//
//  Created by Melaniia Hulianovych on 2/22/17.
//  Copyright © 2017 Melaniia Hulianovych. All rights reserved.
//

import UIKit

extension UIImage {
    
    /**
     Crop image to rect
     */
    func crop(toRect rect: CGRect) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(rect.size, false, self.scale)
        self.draw(at: CGPoint(x: -rect.origin.x, y:-rect.origin.y))
        let cropped_image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return cropped_image
    }
    
    
    /**
     Combine images in array to single image
     */
    class func combine(images: UIImage..., scale: CGFloat) -> UIImage {
        var contextSize = CGSize.zero
        
        for image in images {
            contextSize.width += image.size.width
            contextSize.height = max(contextSize.height, image.size.height)
        }
        
        UIGraphicsBeginImageContextWithOptions(contextSize, false, scale)
        
        for (index, image) in images.enumerated() {
            let originX = image.size.width * CGFloat(index)
            image.draw(in: CGRect(x: originX, y: 0.0, width: image.size.width, height: image.size.height))
        }
        
        let combinedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return combinedImage!
    }
    
    
    class func imageWithLayer(layer: CALayer) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(layer.bounds.size, layer.isOpaque, 0.0)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
    
    class func drawTextImage(withColor:UIColor, withText:String, inRect:CGRect) -> UIImage {
        
        let textRect = CGRect(x: 0, y: 0, width: inRect.size.width, height: inRect.size.height) // rect to display the view in
        let textMask = CATextLayer()
        
        textMask.contentsScale = UIScreen.main.scale // sets the layer's scale to the main screen scale
        textMask.foregroundColor = UIColor.white.cgColor // an opaque color so that the mask covers the text
        
        let myAttributes = [
            NSFontAttributeName: UIFont(name: "Chalkduster", size: 25.0)! , // font
            NSForegroundColorAttributeName: withColor                    // text color
        ]
        let myAttributedString = NSAttributedString(string: "\(withText)", attributes: myAttributes )
        textMask.string = myAttributedString // your text here
        
        textMask.alignmentMode = kCAAlignmentCenter // centered text
        textMask.frame = textRect
        
        return UIImage.imageWithLayer(layer: textMask)
    }
    
    class func drawTwoRectangles(_ frameOne: CGRect, frameTwo: CGRect, progressColor: UIColor, frameColor: UIColor) -> UIImage {
        
        UIGraphicsBeginImageContext(CGSize(width: frameOne.size.width, height: frameOne.size.height))
        let context = UIGraphicsGetCurrentContext()
        
        progressColor.setFill()
        progressColor.setStroke()
        
        let bpath:UIBezierPath = UIBezierPath(rect: frameOne)
        bpath.close()
        bpath.fill()
        bpath.stroke()
        
        UIColor.white.setFill()
        UIColor.white.setStroke()
        
        let bpathTwo:UIBezierPath = UIBezierPath(rect: frameTwo)
        bpathTwo.close()
        bpathTwo.fill()
        bpathTwo.stroke()
        
        frameColor.setStroke()
        
        let bpathThree:UIBezierPath = UIBezierPath(rect: CGRect(origin: CGPoint.zero, size: CGSize(width: frameOne.size.width, height: frameOne.size.height)))
        bpathThree.lineWidth = 2
        bpathThree.close()
        
        bpathThree.stroke()
        
        bpath.append(bpathTwo)
        bpath.append(bpathThree)
        
        context?.addPath(bpath.cgPath)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    class public func setupWithProgress(percent:CGFloat, textToDraw text:String, fontSizeToSet fontSize:CGFloat, progressColor fillColor:UIColor, fontColor textColor:UIColor, rectToDraw:CGRect) -> UIImage {
        
        var whiteImage = UIImage.drawTextImage(withColor: UIColor.white, withText: text, inRect: rectToDraw)
        let grayImage = UIImage.drawTextImage(withColor: UIColor.gray, withText: text, inRect: rectToDraw)
        
        let cropWidth = rectToDraw.size.width * percent
        whiteImage = whiteImage.crop(toRect: CGRect(x: 0.0, y: 0.0, width: cropWidth, height: whiteImage.size.height))!
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: grayImage.size.width, height: grayImage.size.height), false, 4.0)
        grayImage.draw(in: CGRect(x: 0.0, y: 0.0, width: grayImage.size.width, height: grayImage.size.height))
        whiteImage.draw(in: CGRect(x: 0.0, y: 0.0, width: cropWidth, height: grayImage.size.height))
        
        let combinedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let frameOne = CGRect(origin: CGPoint.zero, size: CGSize(width: rectToDraw.size.width, height: rectToDraw.size.height))
        let frameTwo = CGRect(origin: CGPoint(x:cropWidth, y:0), size: CGSize(width: rectToDraw.size.width - cropWidth, height: rectToDraw.size.height))
        let rectIm = UIImage.drawTwoRectangles(frameOne, frameTwo: frameTwo, progressColor:fillColor, frameColor: textColor)
        
        UIGraphicsBeginImageContextWithOptions(rectToDraw.size, false, 0.0)
        
        rectIm.draw(in: rectToDraw)
        combinedImage?.draw(in:CGRect(x: 0, y: rectToDraw.size.height / 2 - fontSize, width: rectToDraw.size.width, height: rectToDraw.size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
