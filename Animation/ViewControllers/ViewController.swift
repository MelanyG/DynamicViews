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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.parentPath = "entered"
        print(self.navigationController?.parentPath ?? "error")
        self.navigationController?.styleNavBar(color: UIColor.green, setTitle: "MainView")
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
     override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchBar.becomeFirstResponder()
        
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        view.endEditing(true)
    }
}

