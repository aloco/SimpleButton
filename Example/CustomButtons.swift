//
//  CustomButtons.swift
//  Example
//
//  Created by Andreas Tinoco Lobo on 08.04.15.
//  Copyright (c) 2015 Andreas Tinoco Lobo. All rights reserved.
//

import Foundation
import SimpleButton

class ScaleButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        
        setBackgroundColor(UIColor(red: 26/255, green: 188/255, blue: 156/255, alpha: 1.0), forState: .Normal)
        
        setTitle(".Normal", forState: .Normal)
        setTitle(".Highlighted", forState: .Highlighted)
        
        setScale(1.0, forState: .Normal, animated: true, animationDuration: 0.25)
        setScale(0.96, forState: .Highlighted, animated: true, animationDuration: 0.1)
    }
}

class BackgroundColorButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        
        setBackgroundColor(UIColor(red: 26/255, green: 188/255, blue: 156/255, alpha: 1.0), forState: .Normal, animated: true, animationDuration: 0.2)
        setBackgroundColor(UIColor(red: 22/255, green: 160/255, blue: 133/255, alpha: 1.0), forState: .Highlighted, animated: false)

        setBackgroundColor(UIColor.darkGrayColor(), forState: SimpleButtonControlState.Loading)
        
        setTitle(".Normal", forState: .Normal)
        setTitle(".Highlighted", forState: .Highlighted)
    }
}

class BorderWidthButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        
        setBackgroundColor(UIColor(red: 26/255, green: 188/255, blue: 156/255, alpha: 1.0), forState: .Normal, animated: true)
        
        setBorderColor(UIColor(red: 22/255, green: 160/255, blue: 133/255, alpha: 1.0), forState: .Normal, animated: true)

        setTitle(".Normal", forState: .Normal)
        setTitle(".Highlighted", forState: .Highlighted)
        
        setBorderWidth(8.0, forState: .Normal, animated: true)
        setBorderWidth(4.0, forState: .Highlighted, animated: true)
        
    }
}

class BorderColorButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        
        setTitleColor(UIColor(red: 26/255, green: 188/255, blue: 156/255, alpha: 1.0), forState: .Normal)
        setTitleColor(UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1.0), forState: .Highlighted)

        setBorderWidth(6.0, forState: .Normal)
        setBorderColor(UIColor(red: 26/255, green: 188/255, blue: 156/255, alpha: 1.0), forState: .Normal, animationDuration: 0.3)
        setBorderColor(UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1.0), forState: .Highlighted, animated: false)

        setTitle(".Normal", forState: .Normal)
        setTitle(".Highlighted", forState: .Highlighted)
        
    }
}

class CornerRadiusButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        
        setBackgroundColor(UIColor(red: 26/255, green: 188/255, blue: 156/255, alpha: 1.0), forState: .Normal, animated: true)
        
        setTitle(".Normal", forState: .Normal)
        setTitle(".Highlighted", forState: .Highlighted)
        
        setCornerRadius(10.0, forState: .Normal, animated: true)
        setCornerRadius(45.0, forState: .Highlighted, animated: true)

    }
}

class ShadowButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        
        setShadowRadius(10, forState: .Highlighted, animated: true)
        setShadowRadius(3, forState: .Normal, animated: true)
        
        setBackgroundColor(UIColor(red: 26/255, green: 188/255, blue: 156/255, alpha: 1.0), forState: .Normal, animated: true)
        
        setShadowColor(UIColor.whiteColor(), forState: .Highlighted, animated: true)

        setShadowOpacity(1.0, forState: .Normal, animated: true)
        
        setShadowOffset(CGSize(width: 0, height: 0), forState: .Normal, animated: true)
        setShadowOffset(CGSize(width: 0, height: 0), forState: .Highlighted, animated: true)

    }
}

class LoadingButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
            
        setBackgroundColor(UIColor(red: 52/255, green: 73/255, blue: 94/255, alpha: 1.0), forState: .Normal)
        setBackgroundColor(UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0), forState: .Highlighted)

        setBackgroundColor(UIColor.lightGrayColor(), forState: SimpleButtonControlState.Loading)
        
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
    }
}

class DisabledButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        
        setBackgroundColor(UIColor(red: 52/255, green: 73/255, blue: 94/255, alpha: 1.0), forState: .Normal)
        setBackgroundColor(UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0), forState: .Highlighted)
        
        setTitle("Press to disabled Button", forState: .Normal)
        setTitle("Button disabled", forState: .Disabled)

        setBackgroundColor(UIColor.lightGrayColor(), forState: .Disabled)
        
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
    }
}