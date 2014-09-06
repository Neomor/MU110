//
//  LoginViewController.swift
//  hw2
//
//  Created by Vasilchenko Yury on 06.09.14.
//  Copyright (c) 2014 neomor studio. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

    @IBAction func loginAction(sender: UIButton) {
        navigationController!.dismissViewControllerAnimated(true, completion:
            nil)
    }

}
