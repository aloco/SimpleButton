//
//  DesignableButton.swift
//  Example
//
//  Created by Gunter Hager on 03.06.16.
//  Copyright © 2016 all about apps. All rights reserved.
//

import UIKit
import SimpleButton

@IBDesignable

class DesignableButton: SimpleButton {
    
        /// Background color for normal state.
    @IBInspectable var backgroundColorNormal: UIColor?
    @IBInspectable var backgroundColorHighlight: UIColor?
    @IBInspectable var titleColorNormal: UIColor?
    @IBInspectable var titleColorHighlighted: UIColor?
    
    @IBInspectable var shadow: Bool = false
    @IBInspectable var shadowColor: UIColor?
    @IBInspectable var shadowOffset: CGSize = CGSize.zero
    @IBInspectable var shadowRadius: CGFloat = 0
    @IBInspectable var shadowOpacity: Float = 0
    
    override func configureButtonStyles() {
        super.configureButtonStyles()
        
        if let backgroundColorNormal = backgroundColorNormal {
            setBackgroundColor(backgroundColorNormal, for: .normal)
        }
        if let backgroundColorHighlight = backgroundColorHighlight {
            setBackgroundColor(backgroundColorHighlight, for: .highlighted)
        }
        if let titleColorNormal = titleColorNormal {
            setTitleColor(titleColorNormal, for: .normal)
        }
        if let titleColorHighlighted = titleColorHighlighted {
            setTitleColor(titleColorHighlighted, for: .highlighted)
        }
        
        if shadow {
            if let shadowColor = shadowColor {
                setShadowColor(shadowColor)
            }
            setShadowOffset(shadowOffset)
            setShadowRadius(shadowRadius)
            setShadowOpacity(shadowOpacity)
        }
    }
    
    
}
