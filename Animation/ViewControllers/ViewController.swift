//
//  ViewController.swift
//  Animation
//
//  Created by Melaniia Hulianovych on 1/12/17.
//  Copyright © 2017 Melaniia Hulianovych. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

//    var customNavBar:BlurNavBar?
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var drawingView: DrawingView!
    @IBOutlet weak var drawImage: UIImageView!
    @IBOutlet weak var constructedIV: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.parentPath = "entered"
//        print(self.navigationController?.parentPath ?? "error")
        self.navigationController?.styleNavBar(color: UIColor.green, setTitle: "MainView")
        drawingView.generalAmount = 10
        drawingView.numberOfFeedbacks = 5
        setupWithRating(rating: 3.2)
        buildGeneralImage()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self

    }
    
     override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        searchBar.becomeFirstResponder()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)

    }
    
    override func viewDidDisappear(_ animated: Bool) {

        super.viewDidDisappear(animated)
        self.navigationController?.parentPath = "exit"
        print(self.navigationController?.parentPath ?? "error")
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
 // MARK: - Private methods
   
//    func styleNavBar() {
//    self.navigationController?.setNavigationBarHidden(true, animated: false)
//        //Get all views in the xib
//        let allViewsInXibArray = Bundle.main.loadNibNamed("BlurNavBar", owner: self, options: nil)
//        customNavBar = allViewsInXibArray?.first as? BlurNavBar
//        customNavBar?.frame = CGRect(x: 0.0, y: 0.0, width: view.bounds.size.width, height: 64.0)
//        customNavBar?.backgroundColor = UIColor.yellow
//
//        view.addSubview(customNavBar!)
//
//    }
    
    
    private final func buildGeneralImage() {
        let generalAmount = 10
        let numberOfFeedbacks = 5.5
        let percent = CGFloat(CGFloat(numberOfFeedbacks * 100) / CGFloat(generalAmount) / 100)
        let text = "\(numberOfFeedbacks)"
        var whiteImage = UIImage.drawTextImage(withColor: UIColor.white, withText: text, inRect: constructedIV.bounds)
        let grayImage = UIImage.drawTextImage(withColor: UIColor.gray, withText: text, inRect: constructedIV.bounds)
        let cropWidth = constructedIV.bounds.size.width * percent
        whiteImage = whiteImage.crop(toRect: CGRect(x: 0.0, y: 0.0, width: cropWidth, height: whiteImage.size.height))!
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: grayImage.size.width, height: grayImage.size.height), false, 4.0)
        grayImage.draw(in: CGRect(x: 0.0, y: 0.0, width: grayImage.size.width, height: grayImage.size.height))
        whiteImage.draw(in: CGRect(x: 0.0, y: 0.0, width: cropWidth, height: grayImage.size.height))
        
        let combinedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
       // constructedIV.image = combinedImage
        let frameOne = CGRect(origin: CGPoint.zero, size: CGSize(width: constructedIV.bounds.size.width, height: constructedIV.bounds.size.height))
        let frameTwo = CGRect(origin: CGPoint(x:cropWidth, y:0), size: CGSize(width: constructedIV.bounds.size.width - cropWidth, height: constructedIV.bounds.size.height))
       let rectIm = UIImage.drawTwoRectangles(frameOne, frameTwo: frameTwo)
        
        UIGraphicsBeginImageContextWithOptions(constructedIV.bounds.size, false, 0.0)

        rectIm.draw(in: constructedIV.bounds)
        combinedImage?.draw(in:CGRect(x: 0, y: constructedIV.bounds.size.height / 2 - 25.0, width: constructedIV.bounds.size.width, height: constructedIV.bounds.size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        constructedIV.image = newImage
    }
    
    func setupWithRating(rating: Double) {
        let whiteBezier = UIBezierPath()
        //radius: 4.0 because in WatchOS we cant obtain view size, we must use some constants
        whiteBezier.drawStarBezier(x: 0, y: 1.0, radius: 3.5, sides: 5, pointyness: 2, angleAdjustment:-18)
        
        let whiteImageStar = whiteBezier.imageRepresentationWithFillColor(UIColor(red: 0.5, green: 0.4, blue: 0.9, alpha: 1.0), scale: Constants.defaultScale)
        let whiteBezierImages = UIImage.combine(images: whiteImageStar, whiteImageStar, whiteImageStar, whiteImageStar, whiteImageStar, scale: Constants.defaultScale)
        
        if rating > 0 {
            let blueBezier = UIBezierPath()
            blueBezier.drawStarBezier(x: 0, y: 1.0, radius: 3.5, sides: 5, pointyness: 2, angleAdjustment:-18)
            let blueImageStar = blueBezier.imageRepresentationWithFillColor(UIColor.blue, scale: Constants.defaultScale)
            var blueBezierImages = UIImage.combine(images: blueImageStar, blueImageStar, blueImageStar, blueImageStar, blueImageStar, scale: Constants.defaultScale)
            
            let cropWidth = CGFloat(blueBezierImages.size.width / 5.0) * CGFloat(rating)
            blueBezierImages = blueBezierImages.crop(toRect: CGRect(x: 0.0, y: 0.0, width: cropWidth, height: blueBezierImages.size.height))!
            
            UIGraphicsBeginImageContextWithOptions(CGSize(width: whiteBezierImages.size.width, height: whiteBezierImages.size.height), false, 4.0)
            whiteBezierImages.draw(in: CGRect(x: 0.0, y: 0.0, width: whiteBezierImages.size.width, height: whiteBezierImages.size.height))
            blueBezierImages.draw(in: CGRect(x: 0.0, y: 0.0, width: cropWidth, height: blueBezierImages.size.height))
            let combinedImage = UIGraphicsGetImageFromCurrentImageContext()
            drawImage.image = combinedImage
            return
        }
        
        drawImage.image = whiteBezierImages
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        view.endEditing(true)
    }
    
    struct Constants {
        static let mimeType = "image"
        static let defaultScale: CGFloat = 4.0
    }
}

