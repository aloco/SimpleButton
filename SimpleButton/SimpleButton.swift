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
    
    /// Loading view. UIActivityIndicatorView as default
    public var loadingView: UIView?
    
    /// Duration of animated state change.
    public var animationDuration: NSTimeInterval = 0.1
    
    /// Represents current button state.
    public override var state: UIControlState {
        // injects custom button state if necessary
        if loading {
            var options = SimpleButtonControlState.Loading
            options.insert(super.state)
            return options
        }
        return super.state
    }
    
    // MARK: State values
    private lazy var backgroundColors: [ControlState: SimpleButtonStateChangeValue<CGColor>] = {
        if let color = self.backgroundColor?.CGColor {
            return [UIControlState.Normal.rawValue: SimpleButtonStateChangeValue(value: color, animated: true)]
        }
        return [:]
    }()
    
    private lazy var borderColors: [ControlState: SimpleButtonStateChangeValue<CGColor>] = {
        if let color = self.layer.borderColor {
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

    
    // MARK: Overrides
    
    override public var enabled: Bool {
        didSet {
            // manually enables / disables user interaction to restore correct state if loading or enabled state are switched separate or together
            if !enabled {
                self.userInteractionEnabled = false
            }
            else if !state.contains(SimpleButtonControlState.Loading) && enabled {
                self.userInteractionEnabled = true
            }
            update()
        }
    }
    
    override public var highlighted: Bool {
        didSet {
            update()
        }
    }
    
    override public var selected: Bool {
        didSet {
            update()
        }
    }
    
    // MARK: Custom states
    
    /// A Boolean value that determines the SimpleButton´s loading state.
    /// Specify `true` to switch to the loading state.
    /// If set to `true`, SimpleButton shows `loadingView` and hides the default `titleLabel` and `imageView`
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
            update()
        }
    }

    
    // MARK: Initializer
    
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
    
    public override func prepareForInterfaceBuilder() {
        configureButtonStyles()
    }
    
    // MARK: Configuration
    
    /**
    To define various styles for specific button states, override this function and set attributes for specific states (e.g. setBackgroundColor(UIColor.blueColor(), forState: .Highlighted, animated: true))
    */
    public func configureButtonStyles() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: Setter for state attributes
    
    /**
    Sets the scale for a specific `UIControlState`
    
    - parameter scale:    scale of button
    - parameter state:    determines at which state that scale applies
    - parameter animated: determines if that change in scale should animate
    */
    public func setScale(scale: CGFloat, forState state: UIControlState = .Normal, animated: Bool = false) {
        buttonScales[state.rawValue] = SimpleButtonStateChangeValue(value: scale, animated: animated)
        updateScale()
    }
    
    /**
     Sets the background color for a specific `UIControlState`
     
     - parameter color:    background color of button
     - parameter state:    determines at which state that background color applies
     - parameter animated: determines if that change in background color should animate
     */
    public func setBackgroundColor(color: UIColor, forState state: UIControlState = .Normal, animated: Bool = false) {
        backgroundColors[state.rawValue] = SimpleButtonStateChangeValue(value: color.CGColor, animated: animated)
        updateBackgroundColor()
    }
    
    /**
     Sets the border width for a specific `UIControlState`
     
     - parameter width:    border width of button
     - parameter state:    determines at which state that border width applies
     - parameter animated: determines if that change in border width should animate
     */
    public func setBorderWidth(width: CGFloat, forState state: UIControlState = .Normal, animated: Bool = false) {
        borderWidths[state.rawValue] = SimpleButtonStateChangeValue(value: width, animated: animated)
        updateBorderWidth()
    }
    
    /**
     Sets the border color for a specific `UIControlState`
     
     - parameter color:    border color of button
     - parameter state:    determines at which state that border color applies
     - parameter animated: determines if that change in border color should animate
     */
    public func setBorderColor(color: UIColor, forState state: UIControlState = .Normal, animated: Bool = false) {
        borderColors[state.rawValue] = SimpleButtonStateChangeValue(value: color.CGColor, animated: animated)
        updateBorderColor()
    }
    
    /**
     Sets the corner radius for a specific `UIControlState`
     
     - parameter radius:   corner radius of button
     - parameter state:    determines at which state that corner radius applies
     - parameter animated: determines if that change in radius of the corners should animate
     */
    public func setCornerRadius(radius: CGFloat, forState state: UIControlState = .Normal, animated: Bool = false) {
        cornerRadii[state.rawValue] = SimpleButtonStateChangeValue(value: radius, animated: animated)
        updateCornerRadius()
    }
    
    /**
     Sets the shadow color for a specific `UIControlState`
     
     - parameter color:    shadow color of button
     - parameter state:    determines at which state that shadow color applies
     - parameter animated: determines if that change in shadow color should animate
     */
    public func setShadowColor(color: UIColor, forState state: UIControlState = .Normal, animated: Bool = false) {
        shadowColors[state.rawValue] = SimpleButtonStateChangeValue(value: color.CGColor, animated: animated)
        updateShadowColor()
    }

    /**
     Sets the shadow opacity for a specific `UIControlState`
     
     - parameter opacity:  shadow opacity of button
     - parameter state:    determines at which state that shadow opacity applies
     - parameter animated: determines if that change in shadow opacity should animate
     */
    public func setShadowOpacity(opacity: Float, forState state: UIControlState = .Normal, animated: Bool = false) {
        shadowOpacities[state.rawValue] = SimpleButtonStateChangeValue(value: opacity, animated: animated)
        updateShadowOpacity()
    }

    /**
     Sets the shadow radius for a specific `UIControlState`
     
     - parameter radius:   shadow radius of button
     - parameter state:    determines at which state that shadow radius applies
     - parameter animated: determines if that change in shadow radius should animate
     */
    public func setShadowRadius(radius: CGFloat, forState state: UIControlState = .Normal, animated: Bool = false) {
        shadowRadii[state.rawValue] = SimpleButtonStateChangeValue(value: radius, animated: animated)
        updateShadowRadius()
    }
    
    /**
     Sets the shadow offset for a specific `UIControlState`
     
     - parameter offset:   shadow offset of button
     - parameter state:    determines at which state that shadow offset applies
     - parameter animated: determines if that change in shadow offset should animate
     */
    public func setShadowOffset(offset: CGSize, forState state: UIControlState = .Normal, animated: Bool = false) {
        shadowOffsets[state.rawValue] = SimpleButtonStateChangeValue(value: offset, animated: animated)
        updateShadowOffset()
    }
    
    /**
    Sets the spacing between `titleLabel` and `imageView`
    
    - parameter spacing: spacing between `titleLabel` and `imageView`
    */
    public func setTitleImageSpacing(spacing: CGFloat) {
        imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing / 2);
        titleEdgeInsets = UIEdgeInsetsMake(0, spacing / 2, 0, 0);
    }
    
    // MARK: Attribute update helper
    
    /**
    Updates all attributes if necessary. Each update function determines by themself if an update of any attribute is necessary. They also determine if that update should animate.
    */
    private func update() {
        updateBackgroundColor()
        updateBorderColor()
        updateBorderWidth()
        updateCornerRadius()
        updateScale()
        updateShadowColor()
        updateShadowOffset()
        updateShadowOpacity()
        updateShadowRadius()
    }
    
    private func updateCornerRadius() {
        if let stateChange = cornerRadii[state.rawValue] ?? cornerRadii[UIControlState.Normal.rawValue] where stateChange.value != layer.cornerRadius {
            if stateChange.animated {
                animateLayer(layer, from: layer.cornerRadius, to: stateChange.value, forKey: "cornerRadius")
            }
            layer.cornerRadius = stateChange.value
        }
    }
    
    private func updateScale() {
        if let stateChange = buttonScales[state.rawValue] ?? buttonScales[UIControlState.Normal.rawValue] where transform.a != stateChange.value && transform.b != stateChange.value {
            let animations = {
                self.transform = CGAffineTransformMakeScale(stateChange.value, stateChange.value)
            }
            (stateChange.animated) ? UIView.animateWithDuration(animationDuration, animations: animations) : animations()
        }
    }
    
    private func updateBackgroundColor() {
        if let stateChange = backgroundColors[state.rawValue] ?? backgroundColors[UIControlState.Normal.rawValue] where layer.backgroundColor == nil || UIColor(CGColor: layer.backgroundColor!) != UIColor(CGColor: stateChange.value) {
            if stateChange.animated {
                animateLayer(layer, from: layer.backgroundColor, to: stateChange.value, forKey: "backgroundColor")
            }
            layer.backgroundColor = stateChange.value
        }
    }
    
    private func updateBorderColor() {
        if let stateChange = borderColors[state.rawValue] ?? borderColors[UIControlState.Normal.rawValue] where layer.borderColor == nil || UIColor(CGColor: layer.borderColor!) != UIColor(CGColor: stateChange.value)  {
            if stateChange.animated {
                animateLayer(layer, from: layer.borderColor, to: stateChange.value, forKey: "borderColor")
            }
            layer.borderColor = stateChange.value
        }
    }
    
    private func updateBorderWidth() {
        if let stateChange = borderWidths[state.rawValue] ?? borderWidths[UIControlState.Normal.rawValue] where stateChange.value != layer.borderWidth {
            if stateChange.animated {
                animateLayer(layer, from: layer.borderWidth, to: stateChange.value, forKey: "borderWidth")
            }
            layer.borderWidth = stateChange.value
        }
    }
    
    private func updateShadowOffset() {
        if let stateChange = shadowOffsets[state.rawValue] ?? shadowOffsets[UIControlState.Normal.rawValue] where stateChange.value != layer.shadowOffset {
            if stateChange.animated {
                animateLayer(layer, from: NSValue(CGSize: layer.shadowOffset), to: NSValue(CGSize: stateChange.value), forKey: "shadowOffset")
            }
            layer.shadowOffset = stateChange.value
        }
    }
    
    private func updateShadowColor() {
        if let stateChange = shadowColors[state.rawValue] ?? shadowColors[UIControlState.Normal.rawValue] where layer.shadowColor == nil || UIColor(CGColor: layer.shadowColor!) != UIColor(CGColor: stateChange.value)  {
            if stateChange.animated {
                animateLayer(layer, from: layer.shadowColor, to: stateChange.value, forKey: "shadowColor")
            }
            layer.shadowColor = stateChange.value
        }
    }
    
    private func updateShadowRadius() {
        if let stateChange = shadowRadii[state.rawValue] ?? shadowRadii[UIControlState.Normal.rawValue] where stateChange.value != layer.shadowRadius {
            if stateChange.animated {
                animateLayer(layer, from: layer.shadowRadius, to: stateChange.value, forKey: "shadowRadius")
            }
            layer.shadowRadius = stateChange.value
        }
    }
    
    private func updateShadowOpacity() {
        if let stateChange = shadowOpacities[state.rawValue] ?? shadowOpacities[UIControlState.Normal.rawValue] where stateChange.value != layer.shadowOpacity {
            if stateChange.animated {
                animateLayer(layer, from: layer.shadowOpacity, to: stateChange.value, forKey: "shadowOpacity")
            }
            layer.shadowOpacity = stateChange.value
        }
    }
    
    // MARK: Animation helper
    private func animateLayer(layer: CALayer, from: AnyObject?, to: AnyObject, forKey key: String) {
        let animation = CABasicAnimation()
        animation.fromValue = from
        animation.toValue = to
        animation.duration = animationDuration
        layer.addAnimation(animation, forKey: key)
    }
    
    // MARK: Layout
    override public func layoutSubviews() {
        super.layoutSubviews()
        loadingView?.center = CGPoint(x: bounds.size.width  / 2,
            y: bounds.size.height / 2)
    }
}
