//
//  ViewController.swift
//  Example
//
//  Created by Andreas Tinoco Lobo on 12/11/15.
//  Copyright © 2015 Andreas Tinoco Lobo. All rights reserved.
//

import UIKit
import SimpleButton

class ViewController: UIViewController {

    @IBOutlet weak var saveButton: LoadingButton!
    @IBOutlet weak var disabledButton: DisabledButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // create SimpleButton from code
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