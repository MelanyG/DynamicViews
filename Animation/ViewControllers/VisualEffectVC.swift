//
//  VisualEffectVC.swift
//  Animation
//
//  Created by Melaniia Hulianovych on 2/1/17.
//  Copyright © 2017 Melaniia Hulianovych. All rights reserved.
//

import UIKit

class VisualEffectVC: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.styleNavBar(color: UIColor.purple, setTitle: "SecondController")
        super.viewWillAppear(animated)
//        print(self.navigationController?.parentPath ?? "error")
//        self.navigationController?.parentPath = "Visual entered"
//        print(self.navigationController?.parentPath ?? "error")
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
//        print(self.navigationController?.parentPath ?? "error")
//        self.navigationController?.parentPath = "Visual exit"
//        print(self.navigationController?.parentPath ?? "error")
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
