//
//  ViewController.swift
//  hw3
//
//  Created by Vasilchenko Yury on 06.09.14.
//  Copyright (c) 2014 neomor studio. All rights reserved.
//

import UIKit

class LecturesListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("detail") as UITableViewCell
        
        cell.textLabel?.text = "Лекция № \(indexPath.row + 1)"
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detail" {
            let vc = segue.destinationViewController as LectureViewController
            if let indexPath = tableView.indexPathForSelectedRow() {
                if vc.lectureDesc != nil {
                    vc.lectureDesc.text = "gdfgdfgdg"
                }
                
            }
        }
        
        

        
        
    }
    
    


}
