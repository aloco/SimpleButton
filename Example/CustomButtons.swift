//
//  CustomButtons.swift
//  Example
//
//  Created by Andreas Tinoco Lobo on 08.04.15.
//  Copyright (c) 2015 Andreas Tinoco Lobo. All rights reserved.
//

import Foundation
import SimpleButton

@IBDesignable
class ScaleButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        setBackgroundColor(UIColor(red: 26/255, green: 188/255, blue: 156/255, alpha: 1.0), forState: .Normal)
        setTitle(".Normal", forState: .Normal)
        setTitle(".Highlighted", forState: .Highlighted)
        setScale(0.97, forState: .Highlighted)
        
    }
}

@IBDesignable
class BackgroundColorButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        setBackgroundColor(UIColor(red: 26/255, green: 188/255, blue: 156/255, alpha: 1.0), forState: .Normal)
        setBackgroundColor(UIColor(red: 22/255, green: 160/255, blue: 133/255, alpha: 1.0), forState: .Highlighted)

        setBackgroundColor(UIColor.darkGrayColor(), forState: SimpleButtonControlState.Loading)
        
        setTitle(".Normal", forState: .Normal)
        setTitle(".Highlighted", forState: .Highlighted)
    }
}

@IBDesignable
class BorderWidthButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        
        setBackgroundColor(UIColor(red: 26/255, green: 188/255, blue: 156/255, alpha: 1.0), forState: .Normal)
        setBorderColor(UIColor(red: 22/255, green: 160/255, blue: 133/255, alpha: 1.0), forState: .Normal)

        setTitle(".Normal", forState: .Normal)
        setTitle(".Highlighted", forState: .Highlighted)
        
        setBorderWidth(8.0, forState: .Normal)
        setBorderWidth(4.0, forState: .Highlighted)
        
    }
}

@IBDesignable
class BorderColorButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        
        setTitleColor(UIColor(red: 26/255, green: 188/255, blue: 156/255, alpha: 1.0), forState: .Normal)
        setTitleColor(UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1.0), forState: .Highlighted)

        setBorderWidth(4.0, forState: .Normal)
        setBorderColor(UIColor(red: 26/255, green: 188/255, blue: 156/255, alpha: 1.0), forState: .Normal)
        setBorderColor(UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1.0), forState: .Highlighted)

        setTitle(".Normal", forState: .Normal)
        setTitle(".Highlighted", forState: .Highlighted)
        
    }
}

@IBDesignable
class CornerRadiusButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        setBackgroundColor(UIColor(red: 26/255, green: 188/255, blue: 156/255, alpha: 1.0), forState: .Normal)
        setTitle(".Normal", forState: .Normal)
        setTitle(".Highlighted", forState: .Highlighted)
        setCornerRadius(10.0, forState: .Normal)
        setCornerRadius(45.0, forState: .Highlighted)

    }
}

@IBDesignable
class ShadowButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        
        setShadowRadius(5, forState: .Highlighted, animated: true)
        setShadowRadius(10, forState: .Normal, animated: true)
        setScale(0.99, forState: .Highlighted, animated: true)
        
        setBackgroundColor(UIColor(red: 26/255, green: 188/255, blue: 156/255, alpha: 1.0), forState: .Normal)
        
        setShadowOpacity(0.6, forState: .Normal)
        setShadowOffset(CGSize(width: 0, height: 1), forState: .Normal)
        setShadowOffset(CGSize(width: 0, height: 2), forState: .Highlighted)
        
    }
}