//
//  DashBoardController.swift
//  WelcomeMIVI
//
//  Created by Arnab on 11/08/18.
//  Copyright © 2018 Arnab. All rights reserved.
//

import UIKit

class DashBoardController: NSObject {
    
   class func getDataAccordingToSelection(selectedIndex : Int) -> [String : Any] {
        
        var returnElement = [String : Any]()
        if selectedIndex == 0
        {
            returnElement = ((((dataInstance["included"] as! [AnyObject])[1])["attributes"]!!) as! [String : Any])
        }
        else if selectedIndex == 1
        {
            returnElement = ((((dataInstance["included"] as! [AnyObject])[2])["attributes"]!!) as! [String : Any])
        }
        else if selectedIndex == 2
        {
            returnElement = ((((dataInstance["included"] as! [AnyObject])[0])["attributes"]!!) as! [String : Any])
        }
        else if selectedIndex == 3
        {
            returnElement = (((dataInstance["data"] as! [String : Any])["attributes"]!) as! [String : Any])
        }
        
        
        
        return returnElement
    }

}
