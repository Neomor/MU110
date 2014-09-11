//
//  LectureViewController.swift
//  hw3
//
//  Created by Vasilchenko Yury on 11.09.14.
//  Copyright (c) 2014 neomor studio. All rights reserved.
//

import UIKit

class LectureViewController: UIViewController {
    
    var lecDesc: String?
    @IBOutlet weak var lectureDesc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lectureDesc.text = lecDesc

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}
