//
//  Extensions.swift
//  CodingExercise
//
//  Created by Arun Thakkar on 12/3/18.
//  Copyright © 2018 Arun Thakkar. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func downloadImageFrom(link:String) {
        self.image = UIImage(named: "placeholder")
        let imageCache = NSCache<NSString, UIImage>()
        if let cachedImage = imageCache.object(forKey: link as NSString) {
            self.image = cachedImage
            return
        }else {
            URLSession.shared.dataTask( with: URL(string:link)!, completionHandler: {
                (data, response, error) -> Void in
                if error != nil {
                    Utility.showAlertOnTopVC(message: error?.localizedDescription ?? DEFAULT_ERR_MSG)
                    self.image = UIImage(named: "placeholder")
                }else {
                    DispatchQueue.main.async {
                        self.contentMode = .scaleToFill
                        if let data = data {
                            self.image = UIImage(data: data)
                            imageCache.setObject(self.image!, forKey: link as NSString)
                        }
                    }
                }
                
            }).resume()
        }
        
    }
}

extension UIAlertController {
    func show(errorMessage :String) {
        let win = UIWindow(frame: UIScreen.main.bounds)
        let vc = UIViewController()
        vc.view.backgroundColor = .clear
        win.rootViewController = vc
        win.windowLevel = UIWindow.Level.alert + 1
        win.makeKeyAndVisible()
        vc.present(self, animated: true) {
        }
    }
}
