//
//  ViewController.swift
//  Animation
//
//  Created by Melaniia Hulianovych on 1/12/17.
//  Copyright © 2017 Melaniia Hulianovych. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.parentPath = "entered"
        print(self.navigationController?.parentPath ?? "error")
    }
    override func viewDidDisappear(_ animated: Bool) {

        super.viewDidDisappear(animated)
        self.navigationController?.parentPath = "exit"
        print(self.navigationController?.parentPath ?? "error")
    }

}

