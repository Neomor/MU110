//
//  ViewController.swift
//  hw2
//
//  Created by Vasilchenko Yury on 06.09.14.
//  Copyright (c) 2014 neomor studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // if (!user.isLogedIn) {
        let loginController: UIViewController = UIStoryboard(name:
            "Authentication", bundle: nil).instantiateInitialViewController() as
        UIViewController
        
        
        navigationController!.presentViewController(loginController, animated:
            true, completion: nil)
        
        //}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

