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
    
    @IBAction func disabledButtonTouchUpInside(_ sender: AnyObject) {
        
        disabledButton.isEnabled = false
        
        // Delay execution of my block for 3 seconds.
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(UInt64(3) * NSEC_PER_SEC)) / Double(NSEC_PER_SEC)) {
            self.disabledButton.isEnabled = true
        }
    }
    
    
    @IBAction func saveButtonTouchUpInside(_ sender: AnyObject) {

        saveButton.isLoading = true
        
        // Delay execution of my block for 3 seconds.
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(UInt64(3) * NSEC_PER_SEC)) / Double(NSEC_PER_SEC)) {
            self.saveButton.isLoading = false
        }
    }
}
