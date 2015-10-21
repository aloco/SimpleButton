//
//  SimpleButton.swift
//  Example
//
//  Created by Andreas Tinoco Lobo on 25.03.15.
//  Copyright (c) 2015 Andreas Tinoco Lobo. All rights reserved.
//

import UIKit

@IBDesignable
public class SimpleButton: UIButton {
    
    typealias ControlState = UInt

    public var animationDuration: NSTimeInterval = 0.1
    public var animateStateChange: Bool = true
    
    lazy private var backgroundColors = [ControlState: CGColor]()
    lazy private var borderColors = [ControlState: CGColor]()
    lazy private var buttonScales = [ControlState: CGFloat]()
    lazy private var borderWidths = [ControlState: CGFloat]()
    lazy private var cornerRadii = [ControlState: CGFloat]()
    
    override public var enabled: Bool {
        didSet {
            updateForStateChange(animateStateChange)
        }
    }
    
    override public var highlighted: Bool {
        didSet {
            updateForStateChange(animateStateChange)
        }
    }
    
    override public var selected: Bool {
        didSet {
            updateForStateChange(animateStateChange)
        }
    }
    
    // MARK: IBInspectable
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            setCornerRadius(cornerRadius)
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            setBorderWidth(borderWidth)
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            if borderColor != nil {
                setBorderColor(borderColor!)
            }
        }
    }
    
    // MARK: Initializer

#if !TARGET_INTERFACE_BUILDER
    required override public init(frame: CGRect) {
        super.init(frame: frame)
        configureButtonStyles()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureButtonStyles()
    }

    override public func awakeFromNib() {
        super.awakeFromNib()
        configureButtonStyles()
    }
#endif
    
    public override func prepareForInterfaceBuilder() {
        configureButtonStyles()
    }
    
    // MARK: Configuration

    public func configureButtonStyles() {
        translatesAutoresizingMaskIntoConstraints = false
        buttonScales[UIControlState.Normal.rawValue] = 1.0
    }
    
    public func setScale(scale: CGFloat, forState state: UIControlState = .Normal, animated: Bool = false) {
        buttonScales[state.rawValue] = scale
        changeScaleForStateChange(animated)
    }
    
    public func setBackgroundColor(color: UIColor, forState state: UIControlState = .Normal, animated: Bool = false) {
        backgroundColors[state.rawValue] = color.CGColor
        changeBackgroundColorForStateChange(animated)
    }
    
    public func setBorderWidth(width: CGFloat, forState state: UIControlState = .Normal, animated: Bool = false) {
        borderWidths[state.rawValue] = width
        changeBorderWidthForStateChange(animated)
    }
    
    public func setBorderColor(color: UIColor, forState state: UIControlState = .Normal, animated: Bool = false) {
        borderColors[state.rawValue] = color.CGColor
        changeBorderColorForStateChange(animated)
    }
    
    public func setCornerRadius(radius: CGFloat, forState state: UIControlState = .Normal, animated: Bool = false) {
        cornerRadii[state.rawValue] = radius
        changeCornerRadiusForStateChange(animated)
    }
    
    // MARK: Helper
    
    public func setTitleImageSpacing(spacing: CGFloat) {
        imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
        titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    }

    // MARK: Private Animation Helpers
    
    private func updateForStateChange(animated: Bool) {
        changeBackgroundColorForStateChange(animated)
        changeBorderColorForStateChange(animated)
        changeScaleForStateChange(animated)
        changeBorderWidthForStateChange(animated)
        changeCornerRadiusForStateChange(animated)
    }
    
    private func changeCornerRadiusForStateChange(animated: Bool = false) {
        if let radius = cornerRadii[state.rawValue] ?? cornerRadii[UIControlState.Normal.rawValue] {
            if radius != layer.cornerRadius {
                if animated {
                    animateLayer(layer, from: layer.cornerRadius, to: radius, forKey: "cornerRadius")
                }
                layer.masksToBounds = radius > 0
                layer.cornerRadius = radius
            }
        }
    }
    
    private func changeScaleForStateChange(animated: Bool = false) {
        if let scale = buttonScales[state.rawValue] ?? buttonScales[UIControlState.Normal.rawValue] {
            if transform.a != scale && transform.b != scale {
                let animations = {
                    self.transform = CGAffineTransformMakeScale(scale, scale)
                }
                animated ? UIView.animateWithDuration(animationDuration, animations: animations) : animations()
            }
        }
    }

    private func changeBackgroundColorForStateChange(animated: Bool = false) {
        if let color = backgroundColors[state.rawValue] ?? backgroundColors[UIControlState.Normal.rawValue] {
            if layer.backgroundColor == nil || UIColor(CGColor: layer.backgroundColor!) != UIColor(CGColor: color) {
                if animated {
                    animateLayer(layer, from: layer.backgroundColor, to: color, forKey: "backgroundColor")
                }
                layer.backgroundColor = color
            }
        }
    }
    
    private func changeBorderColorForStateChange(animated: Bool = false) {
        if let color = borderColors[state.rawValue] ?? borderColors[UIControlState.Normal.rawValue] {
            if layer.borderColor == nil || UIColor(CGColor: layer.borderColor!) != UIColor(CGColor: color) {
                if animated {
                    animateLayer(layer, from: layer.borderColor, to: color, forKey: "borderColor")
                }
                layer.borderColor = color
            }
        }
    }
    
    private func changeBorderWidthForStateChange(animated: Bool = false) {
        if let width = borderWidths[state.rawValue] ?? borderWidths[UIControlState.Normal.rawValue] {
            if width != layer.borderWidth {
                if animated {
                    animateLayer(layer, from: layer.borderWidth, to: width, forKey: "borderWidth")
                }
                layer.borderWidth = width
            }
        }
    }
    
    private func animateLayer(layer: CALayer, from: AnyObject?, to: AnyObject, forKey key: String) {
        let animation = CABasicAnimation()
        animation.fromValue = from
        animation.toValue = to
        animation.duration = animationDuration
        layer.addAnimation(animation, forKey: key)
    }
}
