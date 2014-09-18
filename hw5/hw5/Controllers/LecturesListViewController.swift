//
//  ViewController.swift
//  hw5
//
//  Created by Vasilchenko Yury on 06.09.14.
//  Copyright (c) 2014 neomor studio. All rights reserved.
//

import UIKit

class LecturesListViewController: UITableViewController {
    
    private var lectures: Array<Lecture> = []

    
    // MARK: - UIViewController methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDataFromServer()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueDetail" {
            let vc = segue.destinationViewController as LectureViewController
            if let indexPath = tableView.indexPathForSelectedRow() {
                vc.lecture = self.lectures[indexPath.row]
                
            }
        }
        
    }
    
    
    // MARK: - Internal Logic
    
    func checkUserForAuth() {
        
    }
    @IBAction func exitAction(sender: UIBarButtonItem) {
        showLoginController()
    }
    
    func showLoginController() {
        let loginController: UIViewController = UIStoryboard(name: "Authentication", bundle: nil).instantiateInitialViewController() as UIViewController
        
        navigationController!.presentViewController(loginController, animated: false, completion: nil)
    }
    
    func loadDataFromServer () {
        
        WeeklyAPI.sharedInstance.getAllLectures { (lecturesRes) -> () in
            
            self.lectures = lecturesRes
            self.tableView.reloadData()

        }
        
    }
    
    
    // MARK: - UITableView Delegates
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.lectures.count

    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("lectureCell") as UITableViewCell
        
        cell.textLabel?.text = self.lectures[indexPath.row].name
        
        return cell
    }



}
