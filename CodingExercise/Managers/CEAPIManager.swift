//
//  NEAPIManager.swift
//  CodingExercise
//
//  Created by Arun Thakkar on 12/3/18.
//  Copyright © 2018 Arun Thakkar. All rights reserved.
//

import UIKit

class CEAPIManager: NSObject {
    
    class func getDataUsingRequest(urlString:String, completion:@escaping([Album]?) -> Void) throws{
        guard let url = URL(string: urlString) else {return}
        var requestObj = URLRequest(url: url)
        requestObj.httpMethod = REQUEST_TYPE_GET
        requestObj.timeoutInterval = CONNECTION_TIMEOUT
        DispatchQueue.global(qos: .background).async {
            URLSession.shared.dataTask(with: requestObj) { (data, response, error) in
                DispatchQueue.main.async {
                    if error != nil {
                         Utility.showAlertOnTopVC(message: error?.localizedDescription ?? DEFAULT_ERR_MSG)
                        completion(nil)
                    }else if let response = response as? HTTPURLResponse{
                        if response.statusCode  == 200 {
                            if let data = data,
                                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                                let feed : [String : Any] = json!["feed"] as! [String : Any]
                                if let results : [[String : Any]] = feed["results"] as? [[String : Any]] {
                                    var albums = [Album]()
                                    albums = results.compactMap{ (dictionary) in
                                        return Album(json: dictionary)
                                    }
                                    completion(albums)
                                }
                            }
                        }
                        else{
                            Utility.showAlertOnTopVC(message: error?.localizedDescription ?? DEFAULT_ERR_MSG)
                            completion(nil)
                        }
                    }
                }
                }.resume()
        }
    }
    
}
