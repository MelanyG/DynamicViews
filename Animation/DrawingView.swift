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
//    private final var textMask = CATextLayer()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    
    public override func draw(_ frame: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        UIColor(red: 0/255.0, green: 153/255.0, blue: 216/255.0, alpha: 1.0).setFill()
        //        UIColor.red.setStroke()
        let bpath:UIBezierPath = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x:1, y: 1), size: CGSize(width: frame.size.width/3, height: frame.size.height - 2)), byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: 5, height: 5))
        bpath.lineCapStyle = .round
        bpath.lineJoinStyle = .round
        //        bpath.miterLimit = -10
        bpath.close()
        bpath.fill()
        //        bpath.stroke()
        
        UIColor.white.setFill()
//        UIColor.white.setStroke()
        
        let bpathTwo:UIBezierPath = UIBezierPath(rect: CGRect(origin: CGPoint(x:(frame.size.width - frame.size.width * percent), y: frame.size.height), size: CGSize(width: frame.size.width, height: frame.size.height)))
        bpathTwo.close()
        bpathTwo.fill()
//        bpathTwo.stroke()
        
        UIColor.gray.setStroke()
        
        let bpathThree:UIBezierPath = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x:1, y: 1), size: CGSize(width: frame.size.width - 2, height: frame.size.height - 2)), cornerRadius: 5)
        bpathThree.lineWidth = 2
        bpathThree.close()
        
        bpathThree.stroke()
        
        bpath.append(bpathTwo)
        bpath.append(bpathThree)
        
ctx?.addPath(bpath.cgPath)
//        percent = CGFloat(CGFloat(numberOfFeedbacks * 100) / CGFloat(generalAmount) / 100)
//        let h = frame.height
//        let w = frame.width
//        let color:UIColor = UIColor.yellow
//        
//        let drect1 = CGRect(x: 0, y: 0, width: (w * percent), height: h)
//        let drect2 = CGRect(x: w * percent, y: 0, width: (w - drect1.width), height: h)
//        let ctx = UIGraphicsGetCurrentContext()
//        //4
//        ctx!.addRect(drect1)
//        
////        ctx!.setLineWidth(10)
//        ctx!.setStrokeColor(UIColor.gray.cgColor)
//        ctx!.strokePath()
//        
//        //5
//        ctx!.setFillColor(UIColor.orange.cgColor)
//        ctx!.addRect(drect1)
//        
//        ctx?.fillPath()
//        color.set()
//        ctx!.addRect(drect2)
////        ctx!.setLineWidth(10)
//        ctx!.setStrokeColor(UIColor.gray.cgColor)
//        ctx!.strokePath()
//        
//        //5
//        ctx!.setFillColor(UIColor.gray.cgColor)
//        ctx!.addRect(drect2)
//        
//        ctx?.fillPath()
//        color.set()

//        layer.addSublayer(maskForView)
//        layer.mask = textMask
//         layer.addSublayer(ratingPercentView)
    }
    
    var numberOfFeedbacks: CGFloat = 0 {
        didSet {
//            createMaskView()
//          buildGeneralImage()  
        }
    }
    
//    private final func buildGeneralImage() {
//            percent = CGFloat(CGFloat(numberOfFeedbacks * 100) / CGFloat(generalAmount) / 100)
//        let text = "\(numberOfFeedbacks)"
//        var whiteImage = drawTextImage(withColor: UIColor.white, withText: text)
//        let grayImage = drawTextImage(withColor: UIColor.gray, withText: text)
//        let cropWidth = frame.width * percent
//        whiteImage = whiteImage.crop(toRect: CGRect(x: 0.0, y: 0.0, width: cropWidth, height: whiteImage.size.height))!
//        
//        UIGraphicsBeginImageContextWithOptions(CGSize(width: grayImage.size.width, height: grayImage.size.height), false, 4.0)
//        grayImage.draw(in: CGRect(x: 0.0, y: 0.0, width: grayImage.size.width, height: grayImage.size.height))
//        whiteImage.draw(in: CGRect(x: 0.0, y: 0.0, width: cropWidth, height: grayImage.size.height))
//
//        let combinedImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//    
//    }
    

    private final func createMaskView() {
       
        self.clipsToBounds = true
        layer.borderWidth = 2
        

        setupAssets()
        maskForView.frame = self.bounds

//        drawRectLayer()
        layer.backgroundColor = UIColor.black.cgColor
//        layer.addSublayer(textMask)
//       maskForView?.delegate = maskForView

//        if numberOfFeedbacks == 0 {
//            //            maskForView.backgroundColor = UIColor.lightGray
////            maskForView.backgroundColor = UIColor.lightGray.cgColor
//            layer.borderColor = UIColor.lightGray.cgColor
//        } else {
//
//            layer.borderColor = UIColor.darkGray.cgColor
//        }
//        maskForView.mask = textMask
        
    }
    

    
//    public func drawRectLayer() {
//
//        UIGraphicsBeginImageContext(CGSize(width: self.bounds.width, height: self.bounds.height))
//
//                percent = CGFloat(CGFloat(numberOfFeedbacks * 100) / CGFloat(generalAmount) / 100)
//                let h = frame.height
//                let w = frame.width
//                let color:UIColor = UIColor.yellow
//        
//                let drect1 = CGRect(x: 0, y: 0, width: (w * percent), height: h)
//                let drect2 = CGRect(x: w * percent, y: 0, width: (w - drect1.width), height: h)
//                let ctx = UIGraphicsGetCurrentContext()
//                //4
//                ctx!.addRect(drect1)
//        //        ctx!.setLineWidth(10)
//                ctx!.setStrokeColor(UIColor.gray.cgColor)
//                ctx!.strokePath()
//        
//                //5
//                ctx!.setFillColor(UIColor.orange.cgColor)
//                ctx!.addRect(drect1)
//        
//                ctx?.fillPath()
//                color.set()
//                ctx!.addRect(drect2)
//        //        ctx!.setLineWidth(10)
//                ctx!.setStrokeColor(UIColor.gray.cgColor)
//                ctx!.strokePath()
//                
//                //5
//                ctx!.setFillColor(UIColor.gray.cgColor)
//                ctx!.addRect(drect2)
//                
//                ctx?.fillPath()
//                color.set()
//        let im = UIGraphicsGetImageFromCurrentImageContext()
//        maskForView.contents = im
//    }
    
    private func setupAssets() {
        
        if numberOfFeedbacks == 0 {
            return
        }
        percent = CGFloat(CGFloat(numberOfFeedbacks * 100) / CGFloat(generalAmount) / 100)
        ratingPercentView.backgroundColor = UIColor.orange.cgColor
        ratingPercentView.frame = CGRect(x: 1, y: 1, width: frame.size.width * CGFloat(percent), height: frame.size.height)
//        ratingPercentView.mask = textMask
        if ratingPercentView.superlayer == nil {
//            layer.addSublayer(ratingPercentView)
        }
    }


}
