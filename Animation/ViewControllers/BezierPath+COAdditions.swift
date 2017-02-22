//
//  BezierPath+COAdditions.swift
//  Animation
//
//  Created by Melaniia Hulianovych on 2/22/17.
//  Copyright © 2017 Melaniia Hulianovych. All rights reserved.
//

import UIKit

extension UIBezierPath {
    
    func imageRepresentationWithFillColor(_ fillColor:UIColor?=nil, strokeSize:CGFloat=0, strokeColor:UIColor?=nil, scale:CGFloat=CGFloat(1.0), backgroundColor:UIColor?=nil) -> UIImage {
        
        let canvasSize:CGSize
        if strokeSize > 0 {
            canvasSize = CGSize(width: bounds.size.width + strokeSize, height: bounds.size.height + strokeSize)
            apply(CGAffineTransform(translationX: strokeSize/2.0, y: strokeSize/2.0))
        }
        else {
            canvasSize = bounds.size
        }
        
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        
        if let bgClr = backgroundColor {
            let contextRef = UIGraphicsGetCurrentContext()
            contextRef?.setFillColor(bgClr.cgColor)
            contextRef?.fill(CGRect(x: 0, y: 0, width: canvasSize.width, height: canvasSize.height))
        }
        
        if let fillClr = fillColor {
            fillClr.set()
            fill()
        }
        if let strokeClr = strokeColor,
            strokeSize > 0 {
            strokeClr.set()
            lineWidth = strokeSize
            stroke()
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}


extension UIBezierPath {

    func drawStarBezier(x:CGFloat, y:CGFloat, radius:CGFloat, sides:Int, pointyness:CGFloat, angleAdjustment:Int=0) {
        let starVectorPath = starPath(x: x, y: y, radius: radius, sides: sides, pointyness:pointyness, angleAdjustment:angleAdjustment)
        cgPath = starVectorPath
        apply(CGAffineTransform(translationX: bounds.size.width/2.0, y: bounds.size.height/2.0))
    }
    
    private final func starPath(x:CGFloat, y:CGFloat, radius:CGFloat, sides:Int, pointyness:CGFloat, angleAdjustment:Int=0) -> CGPath {
        let adjustment = (360 / sides / 2) + angleAdjustment
        let path = CGMutablePath()
        let points = polygonPointArray(sides, x:x, y:y, radius:radius, adjustment:CGFloat(angleAdjustment))
        let cpg = points[0]
        let points2 = polygonPointArray(sides, x:x, y:y, radius:radius * pointyness, adjustment:CGFloat(adjustment))
        var i = 0
        path.move(to: CGPoint(x: cpg.x, y: cpg.y))
        for p in points {
            path.addLine(to: CGPoint(x: points2[i].x, y: points2[i].y))
            path.addLine(to: CGPoint(x: p.x, y: p.y))
            i += 1
        }
        path.closeSubpath()
        return path
    }
    
    private final func polygonPointArray(_ sides:Int, x:CGFloat, y:CGFloat, radius:CGFloat, adjustment:CGFloat=0) -> [CGPoint] {
        let angle = degree2radian(360/CGFloat(sides))
        let cx = x // x origin
        let cy = y // y origin
        let r = radius // radius of circle
        var i = sides
        var points = [CGPoint]()
        while points.count <= sides {
            let xpo = cx - r * cos(angle * CGFloat(i) + degree2radian(adjustment))
            let ypo = cy - r * sin(angle * CGFloat(i) + degree2radian(adjustment))
            points.append(CGPoint(x: xpo, y: ypo))
            i -= 1
        }
        return points
    }
    
    private final func degree2radian(_ degree:CGFloat) -> CGFloat {
        return CGFloat(M_PI) * degree/180.0
    }
}
