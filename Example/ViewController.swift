//
//  ViewController.swift
//  Example
//
//  Created by Andreas Tinoco Lobo on 25.03.15.
//  Copyright (c) 2015 Andreas Tinoco Lobo. All rights reserved.
//

import UIKit
import SimpleButton

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
    
        let awesomeButton = SimpleButton.buttonWithType(.Custom) as! SimpleButton
        awesomeButton.setTitle("Awesome".uppercaseString, forState: .Normal)
        awesomeButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        awesomeButton.setBorderWidth(2.0, forState: .Normal)
        awesomeButton.setBorderColor(UIColor.blackColor(), forState: .Normal)
        awesomeButton.setCornerRadius(65, forState: .Normal)
        awesomeButton.setScale(0.95, forState: .Highlighted)
        
        awesomeButton.setNeedsLayout()
        awesomeButton.frame = CGRectMake(0, 0, 130, 130)
        awesomeButton.center = CGPointMake(view.center.x, view.frame.size.height - 90)
        awesomeButton.setTranslatesAutoresizingMaskIntoConstraints(true)
        view.addSubview(awesomeButton)
        
    }
}