//
//  ActivityView.swift
//  CodingExercise
//
//  Created by Arun Thakkar on 12/3/18.
//  Copyright © 2018 Arun Thakkar. All rights reserved.
//

import UIKit

class ActivityView: UIActivityIndicatorView {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    func commonInit(){
        self.color = UIColor.gray
        self.startAnimating()
        self.hidesWhenStopped = true
        self.isHidden = false
    }
}

