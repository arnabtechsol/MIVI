//
//  DataController.swift
//  WelcomeMIVI
//
//  Created by Arnab on 11/08/18.
//  Copyright © 2018 Arnab. All rights reserved.
//

import UIKit

class DataController: NSObject {
    
    private static var privateShared : DataController?
    class func shared() -> DataController { // change class to final to prevent override
        guard let uwShared = privateShared else {
            privateShared = DataController()
            return privateShared!
        }
        return uwShared
    }
    
    var dictionaryForMIVIDetails = [String : Any]()
    
    
    class func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    class func showAlert(classInstance : UIViewController, message : String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        classInstance.present(alert, animated: true, completion: nil)
    }

}
