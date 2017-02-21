//
//  DrawingView.swift
//  Animation
//
//  Created by Melaniia Hulianovych on 2/21/17.
//  Copyright © 2017 Melaniia Hulianovych. All rights reserved.
//

import UIKit

class DrawingView: UIView {

    var backgroundView: UIView?
    var generalAmount:Int = 0
    var percent: CGFloat = 0
    var maskForView = CALayer()
//    internal final var maskForView = TwoRectView()
    private final var ratingPercentView = CALayer()
    private final var textMask = CATextLayer()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    
    public override func draw(_ frame: CGRect) {
        percent = CGFloat(CGFloat(numberOfFeedbacks * 100) / CGFloat(generalAmount) / 100)
        let h = frame.height
        let w = frame.width
        let color:UIColor = UIColor.yellow
        
        let drect1 = CGRect(x: 0, y: 0, width: (w * percent), height: h)
        let drect2 = CGRect(x: w * percent, y: 0, width: (w - drect1.width), height: h)
        let ctx = UIGraphicsGetCurrentContext()
        //4
        ctx!.addRect(drect1)
//        ctx!.setLineWidth(10)
        ctx!.setStrokeColor(UIColor.gray.cgColor)
        ctx!.strokePath()
        
        //5
        ctx!.setFillColor(UIColor.orange.cgColor)
        ctx!.addRect(drect1)
        
        ctx?.fillPath()
        color.set()
        ctx!.addRect(drect2)
//        ctx!.setLineWidth(10)
        ctx!.setStrokeColor(UIColor.gray.cgColor)
        ctx!.strokePath()
        
        //5
        ctx!.setFillColor(UIColor.gray.cgColor)
        ctx!.addRect(drect2)
        
        ctx?.fillPath()
        color.set()

        layer.addSublayer(maskForView)
        layer.mask = textMask
         layer.addSublayer(ratingPercentView)
    }
    
    var numberOfFeedbacks: Int = 0 {
        didSet {
            createMaskView()
            
        }
    }

    private final func createMaskView() {
       
        self.clipsToBounds = true
        layer.borderWidth = 2
        
        let textRect = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height) // rect to display the view in
        
        textMask = CATextLayer()
                textMask.contentsScale = UIScreen.main.scale // sets the layer's scale to the main screen scale
                textMask.foregroundColor = UIColor.white.cgColor // an opaque color so that the mask covers the text
        //        textMask.font = UIFont.systemFont(ofSize: 7) // your font here
        // Attributed string
        let myAttributes = [
            NSFontAttributeName: UIFont(name: "Chalkduster", size: 30.0)! , // font
            NSForegroundColorAttributeName: UIColor.cyan                    // text color
        ]
        let myAttributedString = NSAttributedString(string: "(\(numberOfFeedbacks))", attributes: myAttributes )
        textMask.string = myAttributedString // your text here

        textMask.alignmentMode = kCAAlignmentCenter // centered text
        textMask.frame = CGRect(origin: CGPoint.zero, size: textRect.size)

        setupAssets()
        maskForView.frame = self.bounds
//        layer.addSublayer(maskForView)
//        drawRectLayer()
//       maskForView?.delegate = maskForView

        if numberOfFeedbacks == 0 {
            //            maskForView.backgroundColor = UIColor.lightGray
//            maskForView.backgroundColor = UIColor.lightGray.cgColor
            layer.borderColor = UIColor.lightGray.cgColor
        } else {

            layer.borderColor = UIColor.darkGray.cgColor
        }

        
        
        maskForView.mask = textMask
        
    }
    
    public func drawRectLayer() {

        UIGraphicsBeginImageContext(CGSize(width: self.bounds.width, height: self.bounds.height))


        
                percent = CGFloat(CGFloat(numberOfFeedbacks * 100) / CGFloat(generalAmount) / 100)
                let h = frame.height
                let w = frame.width
                let color:UIColor = UIColor.yellow
        
                let drect1 = CGRect(x: 0, y: 0, width: (w * percent), height: h)
                let drect2 = CGRect(x: w * percent, y: 0, width: (w - drect1.width), height: h)
                let ctx = UIGraphicsGetCurrentContext()
                //4
                ctx!.addRect(drect1)
        //        ctx!.setLineWidth(10)
                ctx!.setStrokeColor(UIColor.gray.cgColor)
                ctx!.strokePath()
        
                //5
                ctx!.setFillColor(UIColor.orange.cgColor)
                ctx!.addRect(drect1)
        
                ctx?.fillPath()
                color.set()
                ctx!.addRect(drect2)
        //        ctx!.setLineWidth(10)
                ctx!.setStrokeColor(UIColor.gray.cgColor)
                ctx!.strokePath()
                
                //5
                ctx!.setFillColor(UIColor.gray.cgColor)
                ctx!.addRect(drect2)
                
                ctx?.fillPath()
                color.set()
        let im = UIGraphicsGetImageFromCurrentImageContext()
     maskForView.contents = im
    }
    
    private func setupAssets() {
        
        if numberOfFeedbacks == 0 {
            return
        }
        percent = CGFloat(CGFloat(numberOfFeedbacks * 100) / CGFloat(generalAmount) / 100)
        ratingPercentView.backgroundColor = UIColor.orange.cgColor
        ratingPercentView.frame = CGRect(x: 1, y: 1, width: frame.size.width * CGFloat(percent), height: frame.size.height)
        ratingPercentView.mask = textMask
        if ratingPercentView.superlayer == nil {
//            layer.addSublayer(ratingPercentView)
        }
    }


}
