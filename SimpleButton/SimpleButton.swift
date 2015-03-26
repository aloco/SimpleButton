//
//  SimpleButton.swift
//  Example
//
//  Created by Andreas Tinoco Lobo on 25.03.15.
//  Copyright (c) 2015 Andreas Tinoco Lobo. All rights reserved.
//

import UIKit

public class SimpleButton: UIButton {
    
    typealias ControlState = UInt

    public var animationDuration: NSTimeInterval = 0.15
    public var animateStateChange: Bool = true
    public var shouldDimWhenDisabled: Bool = true
    
    private var backgroundColors = [ControlState: UIColor]()
    private var borderColors = [ControlState: UIColor]()
    private var buttonScales = [ControlState: CGFloat]()
    
    override public var enabled: Bool {
        didSet {
            setEnabled(enabled, animated: self.animateStateChange)
        }
    }
    
    override public var highlighted: Bool {
        didSet {
            updateForStateChange(self.animateStateChange)
        }
    }
    
    required override public init(frame: CGRect) {
        super.init(frame: frame)
        configurate()
    }

    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configurate()
    }

     override public func awakeFromNib() {
        super.awakeFromNib()
        configurate()
    }

    func configurate() {
        setTranslatesAutoresizingMaskIntoConstraints(false)
        buttonScales[UIControlState.Normal.rawValue] = 1.0
    }
        
    public func setTitleImageSpacing(spacing: CGFloat) {
        imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
        titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    }

    public func setScale(scale: CGFloat, forState state: UIControlState) {
        setScale(scale, forState: state, animated: animateStateChange)
    }
    
    public func setScale(scale: CGFloat, forState state: UIControlState, animated: Bool) {
        buttonScales[state.rawValue] = scale
        
        if state != self.state && transform.a != scale && transform.b != scale {
            changeScaleForStateChangeAnimated(animated)
        }
    }
    
    func changeScaleForStateChangeAnimated(animated: Bool) {
        if let scale = buttonScales[self.state.rawValue] ?? buttonScales[UIControlState.Normal.rawValue] {
            let animations = {
                self.transform = CGAffineTransformMakeScale(scale, scale)
            }
            animated ? UIView.animateWithDuration(animationDuration, animations: animations) :animations()
        }
    }

    public func updateForStateChange(animated: Bool) {
        changeBackgroundColorForStateChangeAnimated(animated)
        changeBorderColorForStateChangeAnimated(animated)
        changeScaleForStateChangeAnimated(animated)
    }
    
    public func setBackgroundColor(color: UIColor, forState state: UIControlState) {
        setBackgroundColor(color, forState: state, animated: animateStateChange)
    }

    public func setBackgroundColor(color: UIColor, forState state: UIControlState, animated: Bool) {
        backgroundColors[state.rawValue] = color
        if state != self.state && backgroundColor != color {
            changeBackgroundColorForStateChangeAnimated(animated)
        }
    }
    
    func changeBackgroundColorForStateChangeAnimated(animated: Bool) {
        if let bColor = backgroundColors[self.state.rawValue] ?? backgroundColors[UIControlState.Normal.rawValue] {
            if bColor != UIColor(CGColor: layer.backgroundColor ?? UIColor.clearColor().CGColor) {
                if animated {
                    animateLayer(layer, fromColor: layer.backgroundColor, toColor: bColor.CGColor, forKey: "backgroundColor")
                }
                layer.backgroundColor = bColor.CGColor
            }
        }
    }
    
    public func setBorderColor(color: UIColor, forState state: UIControlState) {
        setBorderColor(color, forState: state, animated: animateStateChange)
    }
    
    public func setBorderColor(color: UIColor, forState state: UIControlState, animated: Bool) {
        borderColors[state.rawValue] = color
        if state != self.state && UIColor(CGColor: layer.borderColor) != color {
            changeBorderColorForStateChangeAnimated(animated)
        }
    }
    
    func changeBorderColorForStateChangeAnimated(animated: Bool) {
        if let bColor = borderColors[self.state.rawValue] ?? borderColors[UIControlState.Normal.rawValue] {
            if bColor != UIColor(CGColor: layer.borderColor ?? UIColor.clearColor().CGColor) {
                if animated {
                    animateLayer(layer, fromColor: layer.borderColor, toColor: bColor.CGColor, forKey: "borderColor")
                }
                layer.borderColor = bColor.CGColor
            }
        }
    }
    
    
    func setEnabled(enabled: Bool, animated: Bool) {
        if !self.shouldDimWhenDisabled {
            return
        }
        let alphaValue: CGFloat = enabled ? 1 : 0.5
        let animations = {
            self.alpha = alphaValue
        }
        animated ? UIView.animateWithDuration(animationDuration, animations: animations) : animations()
    }
    
    func animateLayer(layer: CALayer, fromColor: CGColorRef?, toColor: CGColorRef, forKey key: String) {
        let fade = CABasicAnimation()
        fade.fromValue = fromColor
        fade.toValue = toColor
        fade.duration = animationDuration
        layer.addAnimation(fade, forKey: key)
    }
}