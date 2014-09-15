//
//  LectureViewController.swift
//  hw4
//
//  Created by Vasilchenko Yury on 11.09.14.
//  Copyright (c) 2014 neomor studio. All rights reserved.
//

import UIKit

class LectureViewController: UIViewController {

  
    var lecture: Lecture?

    @IBOutlet weak var lectureDate: UILabel!
    @IBOutlet weak var lectureName: UILabel!
    @IBOutlet weak var lectureDesc: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let lect = lecture {
            lectureName.text = lect.name
            lectureDate.text = lect.data
            
            lectureDesc.numberOfLines = 2
            lectureDesc.text = lect.desc
        }


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }



}
