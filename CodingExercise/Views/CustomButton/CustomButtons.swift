//
//  CustomButtons.swift
//  CodingExercise
//
//  Created by Arun Thakkar on 12/4/18.
//  Copyright © 2018 Arun Thakkar. All rights reserved.
//

import UIKit

class CustomButtons: UIButton {
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
    func setViewButtonStyle() {
        self.backgroundColor = UIColor(red: 0 / 255.0, green: 45 / 255.0, blue: 92 / 255.0, alpha: 1.0)
        self.tintColor = UIColor.white
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
    }
}
