//
//  Utility.swift
//  CodingExercise
//
//  Created by Arun Thakkar on 12/3/18.
//  Copyright © 2018 Arun Thakkar. All rights reserved.
//

import UIKit

class Utility: NSObject {
    
    class func showAlertOnTopVC(message: String)
    {
        //var messageBody = ""
        DispatchQueue.main.async {
            let alert = UIAlertController(title: ALERT_TITLE_ERR, message: message, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.show(errorMessage: message)
        }
    }
}
