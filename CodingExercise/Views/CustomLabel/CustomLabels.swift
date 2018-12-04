//
//  CustomLabel.swift
//  CodingExercise
//
//  Created by Arun Thakkar on 12/3/18.
//  Copyright © 2018 Arun Thakkar. All rights reserved.
//

import UIKit

class CustomLabels: UILabel {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    func commonInit(){
    }
    
    func setStyleLarge(){
        self.textColor = UIColor.black
        self.font      = UIFont.systemFont(ofSize: 34.0)
    }
    func setStyleMedium() {
        self.textColor = UIColor.darkGray
        self.font      = UIFont.systemFont(ofSize: 17.0)
    }
    func setStyleSmall() {
        
    }
    func setCopyrightStyle() {
        self.textColor = UIColor.black
        self.font = UIFont.systemFont(ofSize: 10.0)
        self.textAlignment = .center
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        self.contentMode = .top
    }
}
