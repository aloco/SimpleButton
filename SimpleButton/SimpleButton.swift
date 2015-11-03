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
    
    private lazy var backgroundColors: [ControlState: SimpleButtonStateChangeValue<CGColor>] = {
        if let color = self.backgroundColor?.CGColor {
            return [UIControlState.Normal.rawValue: SimpleButtonStateChangeValue(value: color, animated: true)]
        }
        return [:]
    }()
    
    private lazy var borderColors: [ControlState: SimpleButtonStateChangeValue<CGColor>] = {
        if let color = self.borderColor?.CGColor {
            return [UIControlState.Normal.rawValue: SimpleButtonStateChangeValue(value: color, animated: true)]
        }
        return [:]
    }()

    private lazy var buttonScales: [ControlState: SimpleButtonStateChangeValue<CGFloat>] = {
        return [UIControlState.Normal.rawValue: SimpleButtonStateChangeValue(value: 1.0, animated: true)]
    }()

    private lazy var borderWidths: [ControlState: SimpleButtonStateChangeValue<CGFloat>] = {
        return [UIControlState.Normal.rawValue: SimpleButtonStateChangeValue(value: self.layer.borderWidth, animated: true)]
    }()

    private lazy var cornerRadii: [ControlState: SimpleButtonStateChangeValue<CGFloat>] = {
        return [UIControlState.Normal.rawValue: SimpleButtonStateChangeValue(value: self.layer.cornerRadius, animated: true)]
    }()
    
    private lazy var shadowColors: [ControlState: SimpleButtonStateChangeValue<CGColor>] = {
        if let color = self.layer.shadowColor {
            return [UIControlState.Normal.rawValue: SimpleButtonStateChangeValue(value: color, animated: true)]
        }
        return [:]
    }()

    private lazy var shadowOpacities: [ControlState: SimpleButtonStateChangeValue<Float>] = {
        return [UIControlState.Normal.rawValue: SimpleButtonStateChangeValue(value: self.layer.shadowOpacity, animated: true)]
    }()

    private lazy var shadowOffsets: [ControlState: SimpleButtonStateChangeValue<CGSize>] = {
        return [UIControlState.Normal.rawValue: SimpleButtonStateChangeValue(value: self.layer.shadowOffset, animated: true)]
    }()

    private lazy var shadowRadii: [ControlState: SimpleButtonStateChangeValue<CGFloat>] = {
        return [UIControlState.Normal.rawValue: SimpleButtonStateChangeValue(value: self.layer.shadowRadius, animated: true)]
    }()

    public var loadingView: UIView?
    
    public override var state: UIControlState {
        if loading {
            var options = SimpleButtonControlState.Loading
            options.insert(super.state)
            return options
        }
        return super.state
    }
    
    override public var enabled: Bool {
        didSet {
            if !enabled {
                self.userInteractionEnabled = false
            }
            else if !state.contains(SimpleButtonControlState.Loading) && enabled {
                self.userInteractionEnabled = true
            }
            updateForStateChange()
        }
    }
    
    override public var highlighted: Bool {
        didSet {
            updateForStateChange()
        }
    }
    
    override public var selected: Bool {
        didSet {
            updateForStateChange()
        }
    }
    
    public var loading: Bool = false {
        didSet {
            if loading {
                self.userInteractionEnabled = false
                if loadingView == nil {
                    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .White)
                    activityIndicator.startAnimating()
                    loadingView = activityIndicator
                    addSubview(loadingView!)
                }
                loadingView?.hidden = false
                titleLabel?.layer.opacity = 0
                imageView?.hidden = true
            }
            else {
                if !self.state.contains(.Disabled) {
                    userInteractionEnabled = true
                }
                loadingView?.hidden = true
                titleLabel?.layer.opacity = 1
                imageView?.hidden = false
            }
            updateForStateChange()
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
    
    @IBInspectable var buttonBackgroundColor: UIColor? {
        didSet {
            if buttonBackgroundColor != nil {
                setBackgroundColor(buttonBackgroundColor!)
            }
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0 {
        didSet {
            setShadowOpacity(shadowOpacity)
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            setShadowRadius(shadowRadius)
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        didSet {
            if shadowColor != nil {
                setShadowColor(shadowColor!)
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
    }
    
    public func setScale(scale: CGFloat, forState state: UIControlState = .Normal, animated: Bool = false) {
        buttonScales[state.rawValue] = SimpleButtonStateChangeValue(value: scale, animated: animated)
        changeScaleForStateChange()
    }
    
    public func setBackgroundColor(color: UIColor, forState state: UIControlState = .Normal, animated: Bool = false) {
        backgroundColors[state.rawValue] = SimpleButtonStateChangeValue(value: color.CGColor, animated: animated)
        changeBackgroundColorForStateChange()
    }
    
    public func setBorderWidth(width: CGFloat, forState state: UIControlState = .Normal, animated: Bool = false) {
        borderWidths[state.rawValue] = SimpleButtonStateChangeValue(value: width, animated: animated)
        changeBorderWidthForStateChange()
    }
    
    public func setBorderColor(color: UIColor, forState state: UIControlState = .Normal, animated: Bool = false) {
        borderColors[state.rawValue] = SimpleButtonStateChangeValue(value: color.CGColor, animated: animated)
        changeBorderColorForStateChange()
    }
    
    public func setCornerRadius(radius: CGFloat, forState state: UIControlState = .Normal, animated: Bool = false) {
        cornerRadii[state.rawValue] = SimpleButtonStateChangeValue(value: radius, animated: animated)
        changeCornerRadiusForStateChange()
    }
    
    public func setShadowColor(color: UIColor, forState state: UIControlState = .Normal, animated: Bool = false) {
        shadowColors[state.rawValue] = SimpleButtonStateChangeValue(value: color.CGColor, animated: animated)
        changeShadowColorForStateChange()
    }

    public func setShadowOpacity(opacity: Float, forState state: UIControlState = .Normal, animated: Bool = false) {
        shadowOpacities[state.rawValue] = SimpleButtonStateChangeValue(value: opacity, animated: animated)
        changeShadowOpacityForStateChange()
    }

    public func setShadowRadius(radius: CGFloat, forState state: UIControlState = .Normal, animated: Bool = false) {
        shadowRadii[state.rawValue] = SimpleButtonStateChangeValue(value: radius, animated: animated)
        changeShadowRadiusForStateChange()
    }
    
    public func setShadowOffset(offset: CGSize, forState state: UIControlState = .Normal, animated: Bool = false) {
        shadowOffsets[state.rawValue] = SimpleButtonStateChangeValue(value: offset, animated: animated)
        changeShadowOffsetForStateChange()
    }
    
    // MARK: Helper
    
    public func setTitleImageSpacing(spacing: CGFloat) {
        imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
        titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    }
    
    // MARK: Private Animation Helpers
    
    private func updateForStateChange() {
        changeBackgroundColorForStateChange()
        changeBorderColorForStateChange()
        changeScaleForStateChange()
        changeBorderWidthForStateChange()
        changeCornerRadiusForStateChange()
        changeShadowOffsetForStateChange()
        changeShadowColorForStateChange()
        changeShadowOpacityForStateChange()
        changeShadowRadiusForStateChange()
    }
    
    private func changeCornerRadiusForStateChange() {
        if let stateChange = cornerRadii[state.rawValue] ?? cornerRadii[UIControlState.Normal.rawValue] where stateChange.value != layer.cornerRadius {
            if stateChange.animated {
                animateLayer(layer, from: layer.cornerRadius, to: stateChange.value, forKey: "cornerRadius")
            }
            layer.cornerRadius = stateChange.value
        }
    }
    
    private func changeScaleForStateChange() {
        if let stateChange = buttonScales[state.rawValue] ?? buttonScales[UIControlState.Normal.rawValue] where transform.a != stateChange.value && transform.b != stateChange.value {
            let animations = {
                self.transform = CGAffineTransformMakeScale(stateChange.value, stateChange.value)
            }
            (stateChange.animated) ? UIView.animateWithDuration(animationDuration, animations: animations) : animations()
        }
    }
    
    private func changeBackgroundColorForStateChange() {
        if let stateChange = backgroundColors[state.rawValue] ?? backgroundColors[UIControlState.Normal.rawValue] where layer.backgroundColor == nil || UIColor(CGColor: layer.backgroundColor!) != UIColor(CGColor: stateChange.value) {
            if stateChange.animated {
                animateLayer(layer, from: layer.backgroundColor, to: stateChange.value, forKey: "backgroundColor")
            }
            layer.backgroundColor = stateChange.value
        }
    }
    
    private func changeBorderColorForStateChange() {
        if let stateChange = borderColors[state.rawValue] ?? borderColors[UIControlState.Normal.rawValue] where layer.borderColor == nil || UIColor(CGColor: layer.borderColor!) != UIColor(CGColor: stateChange.value)  {
            if stateChange.animated {
                animateLayer(layer, from: layer.borderColor, to: stateChange.value, forKey: "borderColor")
            }
            layer.borderColor = stateChange.value
        }
    }
    
    private func changeBorderWidthForStateChange() {
        if let stateChange = borderWidths[state.rawValue] ?? borderWidths[UIControlState.Normal.rawValue] where stateChange.value != layer.borderWidth {
            if stateChange.animated {
                animateLayer(layer, from: layer.borderWidth, to: stateChange.value, forKey: "borderWidth")
            }
            layer.borderWidth = stateChange.value
        }
    }
    
    private func changeShadowOffsetForStateChange() {
        if let stateChange = shadowOffsets[state.rawValue] ?? shadowOffsets[UIControlState.Normal.rawValue] where stateChange.value != layer.shadowOffset {
            if stateChange.animated {
                animateLayer(layer, from: NSValue(CGSize: layer.shadowOffset), to: NSValue(CGSize: stateChange.value), forKey: "shadowOffset")
            }
            layer.shadowOffset = stateChange.value
        }
    }
    
    private func changeShadowColorForStateChange() {
        if let stateChange = shadowColors[state.rawValue] ?? shadowColors[UIControlState.Normal.rawValue] where layer.shadowColor == nil || UIColor(CGColor: layer.shadowColor!) != UIColor(CGColor: stateChange.value)  {
            if stateChange.animated {
                animateLayer(layer, from: layer.shadowColor, to: stateChange.value, forKey: "shadowColor")
            }
            layer.shadowColor = stateChange.value
        }
    }
    
    private func changeShadowRadiusForStateChange() {
        if let stateChange = shadowRadii[state.rawValue] ?? shadowRadii[UIControlState.Normal.rawValue] where stateChange.value != layer.shadowRadius {
            if stateChange.animated {
                animateLayer(layer, from: layer.shadowRadius, to: stateChange.value, forKey: "shadowRadius")
            }
            layer.shadowRadius = stateChange.value
        }
    }
    
    private func changeShadowOpacityForStateChange() {
        if let stateChange = shadowOpacities[state.rawValue] ?? shadowOpacities[UIControlState.Normal.rawValue] where stateChange.value != layer.shadowOpacity {
            if stateChange.animated {
                animateLayer(layer, from: layer.shadowOpacity, to: stateChange.value, forKey: "shadowOpacity")
            }
            layer.shadowOpacity = stateChange.value
        }
    }
    
    private func animateLayer(layer: CALayer, from: AnyObject?, to: AnyObject, forKey key: String) {
        let animation = CABasicAnimation()
        animation.fromValue = from
        animation.toValue = to
        animation.duration = animationDuration
        layer.addAnimation(animation, forKey: key)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        loadingView?.center = CGPoint(x: bounds.size.width  / 2,
            y: bounds.size.height / 2)
    }
}
