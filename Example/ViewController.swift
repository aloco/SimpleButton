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

    @IBOutlet weak var borderButton: UpperCaseButton!
    @IBOutlet weak var disabledButton: SimpleButton!
    @IBOutlet weak var scaledButton: SimpleButton!
    @IBOutlet weak var primaryButton: PrimaryButton!
    
    var simpleButton: SimpleButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        primaryButton.setTitle("Make your own subclass", forState: UIControlState.Normal)
        
        borderButton.setBorderWidth(4.0, forState: .Normal)
        borderButton.setBorderWidth(2.0, forState: .Highlighted)
        borderButton.setCornerRadius(10, forState: .Normal)
        borderButton.setCornerRadius(20, forState: .Highlighted)

        borderButton.setTitle("borderColor", forState: UIControlState.Normal)
        borderButton.setBorderColor(UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1.0), forState: UIControlState.Normal)
        borderButton.setBorderColor(UIColor(red: 149/255, green: 165/255, blue: 166/255, alpha: 1.0), forState: UIControlState.Highlighted)
        borderButton.setTitleColor(UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1.0), forState: UIControlState.Normal)
        
        scaledButton.layer.cornerRadius = 50
        scaledButton.titleLabel?.numberOfLines = 0
        scaledButton.titleLabel?.textAlignment = .Center
        scaledButton.setTitle("scale", forState: UIControlState.Normal)
        scaledButton.setBackgroundColor(UIColor(red: 26/255, green: 188/255, blue: 156/255, alpha: 1.0), forState: UIControlState.Normal)
        scaledButton.setBackgroundColor(UIColor(red: 22/255, green: 160/255, blue: 133/255, alpha: 1.0), forState: UIControlState.Highlighted)
        scaledButton.setScale(0.95, forState: UIControlState.Highlighted)
        
        disabledButton.setTitle("disabled Button", forState: UIControlState.Normal)
        disabledButton.setTitleColor(UIColor(red: 236/255, green: 240/255, blue: 241/255, alpha: 1.0), forState: UIControlState.Normal)
        disabledButton.setTitleColor(UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1.0), forState: UIControlState.Highlighted)
        disabledButton.setBackgroundColor(UIColor(red: 52/255, green: 73/255, blue: 94/255, alpha: 1.0), forState: UIControlState.Normal)
        disabledButton.setBackgroundColor(UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0), forState: UIControlState.Highlighted)
        disabledButton.enabled = false
    }
}

