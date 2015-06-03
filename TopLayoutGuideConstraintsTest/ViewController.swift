//
//  ViewController.swift
//  TopLayoutGuideConstraintsTest
//
//  Created by Tim Ekl on 6/2/15.
//  Copyright (c) 2015 Tim Ekl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Left view is related to top layout guide's top; right is related to top layout guide's bottom.
        for (attr, mult) in [NSLayoutAttribute.Top : CGFloat(0.5), .Bottom : 1.5] {
            let view = UIView()
            view.backgroundColor = UIColor.redColor()
            self.view.addSubview(view)
            
            view.setTranslatesAutoresizingMaskIntoConstraints(false)
            
            // Top: related to top layout guide, either at its top or bottom
            // This is the bug: this difference shouldn't matter, but it does!
            NSLayoutConstraint(item: view, attribute: .Top, relatedBy: .Equal, toItem: self.topLayoutGuide, attribute: attr, multiplier: 1.0, constant: 0.0).active = true
            
            // X: offset from center. (Amount doesn't matter; just here to differentiate views.)
            NSLayoutConstraint(item: view, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: mult, constant: 0.0).active = true
            
            // Size: 50x50
            NSLayoutConstraint(item: view, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 0.0, constant: 50.0).active = true
            NSLayoutConstraint(item: view, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 0.0, constant: 50.0).active = true
        }
    }

}

