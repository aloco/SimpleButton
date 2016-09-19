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
        setBackgroundColor(UIColor.peterRiverColor(), for: .normal)
        setTitle("SCALE", for: .normal)
        setScale(1.0, for: .normal, animated: true, animationDuration: 0.25)
        setScale(0.96, for: .highlighted, animated: true, animationDuration: 0.1)
    }
}

class BackgroundColorButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        setBackgroundColor(UIColor.peterRiverColor(), for: .normal, animated: true, animationDuration: 0.2)
        setBackgroundColor(UIColor.belizeHoleColor(), for: .highlighted, animated: false)
        setBackgroundColor(UIColor.nephritisColor(), for: SimpleButtonControlState.loading)
        setTitle("BACKGROUND COLOR", for: .normal)
    }
}

class BorderWidthButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        setBackgroundColor(UIColor.alizarinColor(), for: .normal, animated: true)
        setBorderColor(UIColor.pomergranateColor(), for: .normal, animated: true)
        setTitle("BORDER WIDTH", for: .normal)
        setBorderWidth(4.0, for: .normal, animated: true, animationDuration: 0.2)
        setBorderWidth(8.0, for: .highlighted, animated: false)
    }
}

class BorderColorButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        setTitleColor(UIColor.alizarinColor(), for: .normal)
        setTitleColor(UIColor.pomergranateColor(), for: .highlighted)
        setBorderWidth(6.0, for: .normal)
        setBorderColor(UIColor.alizarinColor(), for: .normal, animationDuration: 0.3)
        setBorderColor(UIColor.pomergranateColor(), for: .highlighted, animated: false)
        setTitle("BORDER COLOR", for: .normal)
    }
}

class CornerRadiusButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        setBackgroundColor(UIColor.peterRiverColor(), for: .normal, animated: true)
        setTitle("RADIUS", for: .normal)
        setCornerRadius(10.0, for: .normal, animated: true)
        setCornerRadius(30.0, for: .highlighted, animated: true)
    }
}

class ShadowButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        setShadowRadius(10, for: .normal, animated: true)
        setShadowRadius(3, for: .highlighted, animated: true)
        setBackgroundColor(UIColor.alizarinColor(), for: .normal, animated: true)
        setShadowColor(UIColor.asbestosColor(), for: .normal)
        setShadowOpacity(1.0, for: .normal, animated: true)
        setShadowOffset(CGSize(width: 0, height: 0), for: .normal, animated: true)
        setTitle("SHADOW", for: .normal)
    }
}

class LoadingButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        setBackgroundColor(UIColor.peterRiverColor(), for: .normal)
        setBackgroundColor(UIColor.belizeHoleColor(), for: .highlighted)
        setBackgroundColor(UIColor.asbestosColor(), for: SimpleButtonControlState.loading)
        setTitleColor(UIColor.white, for: .normal)
        setTitle("PRESS TO START LOADING", for: .normal)
    }
}

class DisabledButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
        setBackgroundColor(UIColor.alizarinColor(), for: .normal)
        setBackgroundColor(UIColor.pomergranateColor(), for: .highlighted)
        setTitle("PRESS TO DISABLE BUTTON", for: .normal)
        setTitle("BUTTON DISABLED", for: .disabled)
        setBackgroundColor(UIColor.silverColor(), for: .disabled)
        setTitleColor(UIColor.white, for: .normal)
    }
}
