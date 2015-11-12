//
//  ViewController.swift
//  Example
//
//  Created by Andreas Tinoco Lobo on 25.03.15.
//  Copyright (c) 2015 Andreas Tinoco Lobo. All rights reserved.
//

import UIKit
import SimpleButton

class ExamplesOneViewController: UIViewController {

    @IBOutlet weak var backgroundColorButton: BackgroundColorButton!
    
    @IBOutlet var labels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        
        for label in labels {
            label.textColor = UIColor(red: 236/255, green: 240/255, blue: 241/255, alpha: 1.0)
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