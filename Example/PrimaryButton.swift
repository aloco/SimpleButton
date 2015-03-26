//
//  PrimaryButton.swift
//  Example
//
//  Created by Andreas Tinoco Lobo on 26.03.15.
//  Copyright (c) 2015 Andreas Tinoco Lobo. All rights reserved.
//

import SimpleButton

class PrimaryButton: SimpleButton {
    
    override func configurate() {
        layer.borderWidth = 4.0
        setBackgroundColor(UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1.0), forState: UIControlState.Normal)
        setBackgroundColor(UIColor(red: 52/255, green: 73/255, blue: 94/255, alpha: 1.0), forState: UIControlState.Normal)
        setBackgroundColor(UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0), forState: UIControlState.Highlighted)
        setBorderColor(UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0), forState: UIControlState.Normal)
        setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    }
    
    override func setTitle(title: String?, forState state: UIControlState) {
        super.setTitle(title?.uppercaseString, forState: state)
    }
}
