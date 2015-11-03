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

    @IBOutlet weak var backgroundColorButton: BackgroundColorButton!
    
    @IBOutlet var labels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        
        for label in labels {
            label.textColor = UIColor(red: 236/255, green: 240/255, blue: 241/255, alpha: 1.0)
        }
        
        
        
        let awesomeButton = SimpleButton(type:.Custom)
        awesomeButton.setTitle("Awesome".uppercaseString, forState: .Normal)
        
        
        awesomeButton.setBackgroundColor(UIColor.blackColor(), forState: SimpleButtonControlState.Loading, animated: true)
        
        awesomeButton.loading = true
        
        
        awesomeButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        awesomeButton.setTitleColor(UIColor.blackColor(), forState: .Highlighted)
        awesomeButton.setBackgroundColor(UIColor(red: 26/255, green: 188/255, blue: 156/255, alpha: 1.0), forState: .Normal)
        awesomeButton.setBackgroundColor(UIColor.clearColor(), forState: .Highlighted)
        
        awesomeButton.setBorderWidth(0.0, forState: .Normal)
        awesomeButton.setBorderWidth(10.0, forState: .Normal)
        
        awesomeButton.setBorderColor(UIColor.whiteColor(), forState: .Normal)
        awesomeButton.setBorderColor(UIColor.blackColor(), forState: .Highlighted)
        awesomeButton.setCornerRadius(0, forState: .Normal)
        awesomeButton.setCornerRadius(65, forState: .Highlighted)
        awesomeButton.setScale(0.90, forState: .Highlighted)
//
        awesomeButton.setNeedsLayout()
        awesomeButton.frame = CGRectMake(0, 0, 130, 130)
        awesomeButton.center = CGPointMake(view.center.x, view.frame.size.height)
        awesomeButton.translatesAutoresizingMaskIntoConstraints = true
        view.addSubview(awesomeButton)
        
     
    }
    @IBAction func backgroundButtonTouchUpInside(sender: AnyObject) {
        backgroundColorButton.loading = true
        self.backgroundColorButton.enabled = true

        helper(backgroundColorButton)
        
        // Delay execution of my block for 10 seconds.
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(UInt64(2) * NSEC_PER_SEC)), dispatch_get_main_queue()) {
            self.backgroundColorButton.loading = false

                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(UInt64(2) * NSEC_PER_SEC)), dispatch_get_main_queue()) {
                        self.backgroundColorButton.enabled = true
            }


        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    func helper(view: UIView) {
        print(view.userInteractionEnabled)
        if view.userInteractionEnabled == false {
            print(view)
        }
        for view in view.subviews {
            helper(view)
        }
    }
    
}