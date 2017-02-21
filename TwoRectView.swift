//
//  TwoRectView.swift
//  Animation
//
//  Created by Melaniia Hulianovych on 2/21/17.
//  Copyright © 2017 Melaniia Hulianovych. All rights reserved.
//

import UIKit

class TwoRectView: CALayer, CALayerDelegate {

    var percent: CGFloat = 1
    
    required init?(frame: CGRect, percent: CGFloat) {
        super.init()
        let lay = CALayer()
        self.percent = percent
        lay.delegate = self
        setNeedsDisplay()
        self.addSublayer(lay)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    public override func draw(in ctx: CGContext) {
        
//        percent = CGFloat(CGFloat(numberOfFeedbacks * 100) / CGFloat(generalAmount) / 100)
        let h = frame.height
        let w = frame.width
        let color:UIColor = UIColor.yellow
        
        let drect1 = CGRect(x: 0, y: 0, width: (w * percent), height: h)
        let drect2 = CGRect(x: w * percent, y: 0, width: (w - drect1.width), height: h)
        let ctx = UIGraphicsGetCurrentContext()
        //4
        ctx!.addRect(drect1)
        //        ctx!.setLineWidth(10)
        ctx!.setStrokeColor(UIColor.blue.cgColor)
        ctx!.strokePath()
        
        //5
        ctx!.setFillColor(UIColor.green.cgColor)
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

    }
    public override func needsDisplay() -> Bool {
        return true
    }
}
