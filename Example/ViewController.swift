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

    @IBOutlet weak var disabledButton: SimpleButton!
    @IBOutlet weak var coloredButton: SimpleButton!
    @IBOutlet weak var borderButton: SimpleButton!
    @IBOutlet weak var scaledButton: SimpleButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coloredButton.setTitle("BACKGROUND COLOR", forState: UIControlState.Normal)
        coloredButton.setTitleColor(UIColor(red: 236/255, green: 240/255, blue: 241/255, alpha: 1.0), forState: UIControlState.Normal)
        coloredButton.setTitleColor(UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1.0), forState: UIControlState.Highlighted)
        coloredButton.setBackgroundColor(UIColor(red: 52/255, green: 73/255, blue: 94/255, alpha: 1.0), forState: UIControlState.Normal)
        coloredButton.setBackgroundColor(UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0), forState: UIControlState.Highlighted)

        borderButton.layer.borderWidth = 4.0
        borderButton.setTitle("BORDER COLOR", forState: UIControlState.Normal)
        borderButton.setBorderColor(UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1.0), forState: UIControlState.Normal)
        borderButton.setBorderColor(UIColor(red: 149/255, green: 165/255, blue: 166/255, alpha: 1.0), forState: UIControlState.Highlighted)
        borderButton.setTitleColor(UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1.0), forState: UIControlState.Normal)
        
        scaledButton.layer.cornerRadius = 50
        scaledButton.titleLabel?.numberOfLines = 0
        scaledButton.titleLabel?.textAlignment = .Center
        scaledButton.setTitle("SCALE", forState: UIControlState.Normal)
        scaledButton.setBackgroundColor(UIColor(red: 26/255, green: 188/255, blue: 156/255, alpha: 1.0), forState: UIControlState.Normal)
        scaledButton.setBackgroundColor(UIColor(red: 22/255, green: 160/255, blue: 133/255, alpha: 1.0), forState: UIControlState.Highlighted)
        scaledButton.setScale(0.95, forState: UIControlState.Highlighted)
        
        disabledButton.setTitle("DISABLED BUTTON", forState: UIControlState.Normal)
        disabledButton.setTitleColor(UIColor(red: 236/255, green: 240/255, blue: 241/255, alpha: 1.0), forState: UIControlState.Normal)
        disabledButton.setTitleColor(UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1.0), forState: UIControlState.Highlighted)
        disabledButton.setBackgroundColor(UIColor(red: 52/255, green: 73/255, blue: 94/255, alpha: 1.0), forState: UIControlState.Normal)
        disabledButton.setBackgroundColor(UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0), forState: UIControlState.Highlighted)
        disabledButton.enabled = false
    }
}

