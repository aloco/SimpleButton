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
        super.configurate()
        
        setBorderWidth(4.0, forState: .Normal)
        setBorderWidth(3.0, forState: .Highlighted)
        
        setBackgroundColor(UIColor(red: 52/255, green: 73/255, blue: 94/255, alpha: 1.0), forState: .Normal)
        setBackgroundColor(UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0), forState: .Highlighted)
        setBackgroundColor(UIColor.grayColor(), forState: .Disabled)

        setBorderColor(UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0), forState: .Normal)
        setScale(0.98, forState: .Highlighted)
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
}
