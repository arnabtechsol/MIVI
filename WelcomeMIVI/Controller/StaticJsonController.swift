//
//  StaticJsonController.swift
//  CheckFramework
//
//  Created by Arnab on 11/08/18.
//  Copyright © 2018 Arnab. All rights reserved.
//

import UIKit

class StaticJsonController: NSObject {
    
    
    
    class func getWFEJSONDataFromDocumentDirectory()
    {
        let dataController = DataController.shared()
        
        let jsonFilePath = (Bundle.main.resourceURL?.path)!  + "/" + DEFAULT_JSON_FILE
        
        dataController.dictionaryForMIVIDetails = StaticJsonController.convertToDictionary(jsonFile: DEFAULT_JSON_FILE, jsonFilePath: jsonFilePath)
        
    }
    
    
    // ********************************************************* //
    
    class func convertToDictionary(jsonFile : String, jsonFilePath : String) -> [String: Any]
    {
        
        var responseString : String?
        var content : String?
        
        let path = jsonFilePath
        
        do {
            content = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
            responseString = content
            
        } catch
        {
            let nsError = error as NSError
            
            print(nsError.localizedDescription)
            
        }
        
        
        var responseDict: [String: Any] = [:]
        
        if let data = responseString?.data(using: .utf8) {
            do {
                responseDict = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return responseDict
    }
    
}
