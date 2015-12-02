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
        setBackgroundColor(UIColor.peterRiverColor(), forState: .Normal)
        setTitle("SCALE", forState: .Normal)
        setScale(1.0, forState: .Normal, animated: true, animationDuration: 0.25)
        setScale(0.96, forState: .Highlighted, animated: true, animationDuration: 0.1)
    }
}

class BackgroundColorButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        setBackgroundColor(UIColor.peterRiverColor(), forState: .Normal, animated: true, animationDuration: 0.2)
        setBackgroundColor(UIColor.belizeHoleColor(), forState: .Highlighted, animated: false)
        setBackgroundColor(UIColor.nephritisColor(), forState: SimpleButtonControlState.Loading)
        setTitle("BACKGROUND COLOR", forState: .Normal)
    }
}

class BorderWidthButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        setBackgroundColor(UIColor.alizarinColor(), forState: .Normal, animated: true)
        setBorderColor(UIColor.pomergranateColor(), forState: .Normal, animated: true)
        setTitle("BORDER WIDTH", forState: .Normal)
        setBorderWidth(4.0, forState: .Normal, animated: true, animationDuration: 0.2)
        setBorderWidth(8.0, forState: .Highlighted, animated: false)
    }
}

class BorderColorButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        setTitleColor(UIColor.alizarinColor(), forState: .Normal)
        setTitleColor(UIColor.pomergranateColor(), forState: .Highlighted)
        setBorderWidth(6.0, forState: .Normal)
        setBorderColor(UIColor.alizarinColor(), forState: .Normal, animationDuration: 0.3)
        setBorderColor(UIColor.pomergranateColor(), forState: .Highlighted, animated: false)
        setTitle("BORDER COLOR", forState: .Normal)
    }
}

class CornerRadiusButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        setBackgroundColor(UIColor.peterRiverColor(), forState: .Normal, animated: true)
        setTitle("RADIUS", forState: .Normal)
        setCornerRadius(10.0, forState: .Normal, animated: true)
        setCornerRadius(30.0, forState: .Highlighted, animated: true)
    }
}

class ShadowButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        setShadowRadius(10, forState: .Normal, animated: true)
        setShadowRadius(3, forState: .Highlighted, animated: true)
        setBackgroundColor(UIColor.alizarinColor(), forState: .Normal, animated: true)
        setShadowColor(UIColor.asbestosColor(), forState: .Normal)
        setShadowOpacity(1.0, forState: .Normal, animated: true)
        setShadowOffset(CGSize(width: 0, height: 0), forState: .Normal, animated: true)
        setTitle("SHADOW", forState: .Normal)
    }
}

class LoadingButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        setBackgroundColor(UIColor.peterRiverColor(), forState: .Normal)
        setBackgroundColor(UIColor.belizeHoleColor(), forState: .Highlighted)
        setBackgroundColor(UIColor.asbestosColor(), forState: SimpleButtonControlState.Loading)
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
        setTitle("PRESS TO START LOADING", forState: .Normal)
    }
}

class DisabledButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        setBackgroundColor(UIColor.peterRiverColor(), forState: .Normal)
        setBackgroundColor(UIColor.belizeHoleColor(), forState: .Highlighted)
        setTitle("PRESS TO DISABLE BUTTON", forState: .Normal)
        setTitle("BUTTON DISABLED", forState: .Disabled)
        setBackgroundColor(UIColor.silverColor(), forState: .Disabled)
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
}