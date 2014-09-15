//
//  ViewController.swift
//  hw4
//
//  Created by Vasilchenko Yury on 06.09.14.
//  Copyright (c) 2014 neomor studio. All rights reserved.
//

import UIKit
import Alamofire

class LecturesListViewController: UITableViewController {
    
    private var lectures: Array<Lecture> = []
    private let apiEndPoint = "http://weekly.master-up.net/api/v1/lecture/list/"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.GET, apiEndPoint)
            .responseJSON {(request, response, JSON, error) in JSON
                
                if JSON is Array<AnyObject> {                    
                    
                    for item in JSON as Array<AnyObject> {
                        
                        let lecture = Lecture()
                        
                        lecture.name = (item["name"] as AnyObject? as? String) ?? ""
                        lecture.data = (item["data"] as AnyObject? as? String) ?? ""
                        lecture.desc = (item["description"] as AnyObject? as? String) ?? ""
                        lecture.image = (item["image"] as AnyObject? as? String) ?? ""
                        lecture.video = (item["video"] as AnyObject? as? String) ?? ""
                        
                        self.lectures.append(lecture)
                    }
                    
                }
            
                self.tableView.reloadData()
            }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.lectures.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("lectureCell") as UITableViewCell
        
        cell.textLabel?.text = self.lectures[indexPath.row].name

        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueDetail" {
            let vc = segue.destinationViewController as LectureViewController
            if let indexPath = tableView.indexPathForSelectedRow() {
                vc.lecture = self.lectures[indexPath.row]
            }
        }



    }




}
