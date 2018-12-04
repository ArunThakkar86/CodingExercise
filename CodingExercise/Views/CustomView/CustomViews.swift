//
//  CustomViews.swift
//  CodingExercise
//
//  Created by Arun Thakkar on 12/3/18.
//  Copyright © 2018 Arun Thakkar. All rights reserved.
//

import UIKit

class CustomViews: UIView {

}
class LoadingView: UIView {
    var activity : ActivityView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        activity = ActivityView.init(frame: self.frame)
        activity.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(activity)
        self.setUpActivityView()
    }
    private func setUpActivityView() {
        let horConstraint = NSLayoutConstraint(item: activity!, attribute: .centerX, relatedBy: .equal,
                                               toItem: self, attribute: .centerX,
                                               multiplier: 1.0, constant: 0.0)
        let verConstraint = NSLayoutConstraint(item: activity!, attribute: .centerY, relatedBy: .equal,
                                               toItem: self, attribute: .centerY,
                                               multiplier: 1.0, constant: 0.0)
        let widConstraint = NSLayoutConstraint(item: activity!, attribute: .width, relatedBy: .equal,
                                               toItem: self, attribute: .width,
                                               multiplier: 1.0, constant: 30.0)
        let heiConstraint = NSLayoutConstraint(item: activity!, attribute: .height, relatedBy: .equal,
                                               toItem: self, attribute: .height,
                                               multiplier: 1.0, constant: 30.0)
        
        self.addConstraints([horConstraint, verConstraint, widConstraint, heiConstraint])
        
    }
    
    func hideLoadingView(){
        self.activity.stopAnimating()
        self.isHidden = true
    }
    func showLoadingView(){
        self.activity.startAnimating()
        self.isHidden = false
    }
    
}

class SepratorView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        self.backgroundColor = UIColor.darkGray
    }
    
}
