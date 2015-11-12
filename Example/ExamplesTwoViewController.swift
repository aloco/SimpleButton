//
//  ExamplesTwoViewController.swift
//  Example
//
//  Created by Andreas Tinoco Lobo on 12/11/15.
//  Copyright © 2015 Andreas Tinoco Lobo. All rights reserved.
//

import UIKit
import SimpleButton

class ExamplesTwoViewController: UIViewController {

    @IBOutlet weak var saveButton: LoadingButton!
    @IBOutlet weak var disabledButton: DisabledButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // create SimpleButton from code
        
        let awesomeButton = SimpleButton(type:.Custom)
        awesomeButton.setTitle("Awesome".uppercaseString, forState: .Normal)
        
        awesomeButton.setBackgroundColor(UIColor.blackColor(), forState: SimpleButtonControlState.Loading, animated: true)
        
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
        
        awesomeButton.setShadowColor(UIColor.blackColor())
        awesomeButton.setShadowOffset(CGSize(width: 0, height: 0))
        awesomeButton.setShadowRadius(10)
        awesomeButton.setShadowOpacity(1)
        //
        awesomeButton.setNeedsLayout()
        awesomeButton.frame = CGRectMake(0, 0, 130, 130)
        awesomeButton.center = CGPointMake(view.center.x, view.frame.size.height - 260)
        awesomeButton.translatesAutoresizingMaskIntoConstraints = true
        view.addSubview(awesomeButton)
        

    }
    
    @IBAction func disabledButtonTouchUpInside(sender: AnyObject) {
        
        disabledButton.enabled = false
        
        // Delay execution of my block for 2 seconds.
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(UInt64(3) * NSEC_PER_SEC)), dispatch_get_main_queue()) {
            self.disabledButton.enabled = true
        }
    }
    
    
    @IBAction func saveButtonTouchUpInside(sender: AnyObject) {

        saveButton.loading = true
        
        // Delay execution of my block for 2 seconds.
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(UInt64(3) * NSEC_PER_SEC)), dispatch_get_main_queue()) {
            self.saveButton.loading = false
        }
    }
}