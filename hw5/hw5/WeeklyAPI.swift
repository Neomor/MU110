//
//  WeeklyAPI.swift
//  hw5
//
//  Created by Vasilchenko Yury on 17.09.14.
//  Copyright (c) 2014 neomor studio. All rights reserved.
//

import Foundation
import Alamofire

class WeeklyAPI: NSObject {
    
    private let apiEndPoint = "http://weekly.master-up.net/api/v1/lecture/list/"
    
    class var sharedInstance: WeeklyAPI {
        
    struct Static {
        static var onceToken: dispatch_once_t = 0
        static var instance: WeeklyAPI? = nil
        }
        
        dispatch_once( &Static.onceToken, { () -> Void in
            Static.instance = WeeklyAPI()
            
        })
        return Static.instance!
    }
    
    func getAllLectures (Result: (Array<Lecture>?) -> Void ) {
        Alamofire.request(.GET, apiEndPoint)
            .responseJSON {(request, response, JSON, error) in JSON
                
                var lectures: Array<Lecture> = []
                
                if JSON is Array<AnyObject> {
                    
                    for item in JSON as Array<AnyObject> {
                        
                        let lecture = Lecture()
                        
                        lecture.name = (item["name"] as AnyObject? as? String) ?? ""
                        lecture.data = (item["data"] as AnyObject? as? String) ?? ""
                        lecture.desc = (item["description"] as AnyObject? as? String) ?? ""
                        lecture.image = (item["image"] as AnyObject? as? String) ?? ""
                        lecture.video = (item["video"] as AnyObject? as? String) ?? ""
                        
                        lectures.append(lecture)
                    }
                    
                }
                
                Result (lectures)
        }

        
    }
    
}
