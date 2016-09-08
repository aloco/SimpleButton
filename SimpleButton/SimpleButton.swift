//
//  SimpleButton.swift
//  Example
//
//  Created by Andreas Tinoco Lobo on 25.03.15.
//  Copyright (c) 2015 Andreas Tinoco Lobo. All rights reserved.
//

import UIKit


open class SimpleButton: UIButton {
    
    typealias ControlState = UInt
    
    /// Loading view. UIActivityIndicatorView as default
    open var loadingView: UIView?
    
    /// Default duration of animated state change.
    open var defaultAnimationDuration: TimeInterval = 0.1
    
    /// Represents current button state.
    open override var state: UIControlState {
        // injects custom button state if necessary
        if isLoading {
            var options = SimpleButtonControlState.loading
            options.insert(super.state)
            return options
        }
        return super.state
    }
    
    /// used to lock any animated state transition for initial setup
    fileprivate var lockAnimatedUpdate: Bool = true
    
    /// used to determine the `from` value of any animation
    fileprivate var sourceLayer: CALayer {
        return (layer.presentation() ?? layer) 
    }
    
    // MARK: State values with initial values
    fileprivate lazy var backgroundColors: [ControlState: SimpleButtonStateChangeValue<CGColor>] = {
        if let color = self.backgroundColor?.cgColor {
            return [UIControlState.normal.rawValue: SimpleButtonStateChangeValue(value: color, animated: true, animationDuration: self.defaultAnimationDuration)]
        }
        return [:]
    }()
    
    fileprivate lazy var borderColors: [ControlState: SimpleButtonStateChangeValue<CGColor>] = {
        if let color = self.layer.borderColor {
            return [UIControlState.normal.rawValue: SimpleButtonStateChangeValue(value: color, animated: true, animationDuration: self.defaultAnimationDuration)]
        }
        return [:]
    }()

    fileprivate lazy var buttonScales: [ControlState: SimpleButtonStateChangeValue<CGFloat>] = {
        return [UIControlState.normal.rawValue: SimpleButtonStateChangeValue(value: 1.0, animated: true, animationDuration: self.defaultAnimationDuration)]
    }()

    fileprivate lazy var borderWidths: [ControlState: SimpleButtonStateChangeValue<CGFloat>] = {
        return [UIControlState.normal.rawValue: SimpleButtonStateChangeValue(value: self.layer.borderWidth, animated: true, animationDuration: self.defaultAnimationDuration)]
    }()

    fileprivate lazy var cornerRadii: [ControlState: SimpleButtonStateChangeValue<CGFloat>] = {
        return [UIControlState.normal.rawValue: SimpleButtonStateChangeValue(value: self.layer.cornerRadius, animated: true, animationDuration: self.defaultAnimationDuration)]
    }()
    
    fileprivate lazy var shadowColors: [ControlState: SimpleButtonStateChangeValue<CGColor>] = {
        if let color = self.layer.shadowColor {
            return [UIControlState.normal.rawValue: SimpleButtonStateChangeValue(value: color, animated: true, animationDuration: self.defaultAnimationDuration)]
        }
        return [:]
    }()

    fileprivate lazy var shadowOpacities: [ControlState: SimpleButtonStateChangeValue<Float>] = {
        return [UIControlState.normal.rawValue: SimpleButtonStateChangeValue(value: self.layer.shadowOpacity, animated: true, animationDuration: self.defaultAnimationDuration)]
    }()

    fileprivate lazy var shadowOffsets: [ControlState: SimpleButtonStateChangeValue<CGSize>] = {
        return [UIControlState.normal.rawValue: SimpleButtonStateChangeValue(value: self.layer.shadowOffset, animated: true, animationDuration: self.defaultAnimationDuration)]
    }()

    fileprivate lazy var shadowRadii: [ControlState: SimpleButtonStateChangeValue<CGFloat>] = {
        return [UIControlState.normal.rawValue: SimpleButtonStateChangeValue(value: self.layer.shadowRadius, animated: true, animationDuration: self.defaultAnimationDuration)]
    }()

    
    // MARK: Overrides
    
    override open var isEnabled: Bool {
        didSet {
            // manually enables / disables user interaction to restore correct state if loading or enabled state are switched separate or together
            if !isEnabled {
                self.isUserInteractionEnabled = false
            }
            else if !state.contains(SimpleButtonControlState.loading) && isEnabled {
                self.isUserInteractionEnabled = true
            }
            update()
        }
    }
    
    override open var isHighlighted: Bool {
        didSet {
            update()
        }
    }
    
    override open var isSelected: Bool {
        didSet {
            update()
        }
    }
    
    // MARK: Custom states
    
    /// A Boolean value that determines the SimpleButton´s loading state.
    /// Specify `true` to switch to the loading state.
    /// If set to `true`, SimpleButton shows `loadingView` and hides the default `titleLabel` and `imageView`
    open var isLoading: Bool = false {
        didSet {
            if isLoading {
                self.isUserInteractionEnabled = false
                if loadingView == nil {
                    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
                    activityIndicator.startAnimating()
                    activityIndicator.hidesWhenStopped = false
                    loadingView = activityIndicator
                    addSubview(loadingView!)
                }
                loadingView?.isHidden = false
                titleLabel?.layer.opacity = 0
                imageView?.isHidden = true
            }
            else {
                if !self.state.contains(.disabled) {
                    isUserInteractionEnabled = true
                }
                loadingView?.isHidden = true
                titleLabel?.layer.opacity = 1
                imageView?.isHidden = false
            }
            update()
        }
    }

    
    // MARK: Initializer
    
    required override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    fileprivate func setup() {
        lockAnimatedUpdate = true
        configureButtonStyles()
        update()
        lockAnimatedUpdate = false
    }
    
    // MARK: Configuration
    
    /**
    To define various styles for specific button states, override this function and set attributes for specific states (e.g. setBackgroundColor(UIColor.blueColor(), for: .Highlighted, animated: true))
    */
    open func configureButtonStyles() {
    }
    
    // MARK: Setter for state attributes
    
    /**
    Sets the scale for a specific `UIControlState`
    
    - parameter scale:    scale of button
    - parameter state:    determines at which state that scale applies
    - parameter animated: determines if that change in scale should animate. Default is `true`
    - parameter animationDuration: set this value if you need a specific animation duration for this specific state change. If this is nil, the animation duration is taken from `defaultAnimationDuration`
    */
    open func setScale(_ scale: CGFloat, for state: UIControlState = .normal, animated: Bool = true, animationDuration: TimeInterval? = nil) {
        buttonScales[state.rawValue] = SimpleButtonStateChangeValue(value: scale, animated: animated, animationDuration: animationDuration ?? self.defaultAnimationDuration)
        updateScale()
    }
    
    /**
     Sets the background color for a specific `UIControlState`
     
     - parameter color:    background color of button
     - parameter state:    determines at which state that background color applies
     - parameter animated: determines if that change in background color should animate. Default is `true`
     - parameter animationDuration: set this value if you need a specific animation duration for this specific state change. If this is nil, the animation duration is taken from `defaultAnimationDuration`
     */
    open func setBackgroundColor(_ color: UIColor, for state: UIControlState = .normal, animated: Bool = true, animationDuration: TimeInterval? = nil) {
        backgroundColors[state.rawValue] = SimpleButtonStateChangeValue(value: color.cgColor, animated: animated, animationDuration: animationDuration ?? self.defaultAnimationDuration)
        updateBackgroundColor()
    }
    
    /**
     Sets the border width for a specific `UIControlState`
     
     - parameter width:    border width of button
     - parameter state:    determines at which state that border width applies
     - parameter animated: determines if that change in border width should animate. Default is `true`
     - parameter animationDuration: set this value if you need a specific animation duration for this specific state change. If this is nil, the animation duration is taken from `defaultAnimationDuration`
     */
    open func setBorderWidth(_ width: CGFloat, for state: UIControlState = .normal, animated: Bool = true, animationDuration: TimeInterval? = nil) {
        borderWidths[state.rawValue] = SimpleButtonStateChangeValue(value: width, animated: animated, animationDuration: animationDuration ?? self.defaultAnimationDuration)
        updateBorderWidth()
    }
    
    /**
     Sets the border color for a specific `UIControlState`
     
     - parameter color:    border color of button
     - parameter state:    determines at which state that border color applies
     - parameter animated: determines if that change in border color should animate. Default is `true`
     - parameter animationDuration: set this value if you need a specific animation duration for this specific state change. If this is nil, the animation duration is taken from `defaultAnimationDuration`
     */
    open func setBorderColor(_ color: UIColor, for state: UIControlState = .normal, animated: Bool = true, animationDuration: TimeInterval? = nil) {
        borderColors[state.rawValue] = SimpleButtonStateChangeValue(value: color.cgColor, animated: animated, animationDuration: animationDuration ?? self.defaultAnimationDuration)
        updateBorderColor()
    }
    
    /**
     Sets the corner radius for a specific `UIControlState`
     
     - parameter radius:   corner radius of button
     - parameter state:    determines at which state that corner radius applies
     - parameter animated: determines if that change in radius of the corners should animate. Default is `true`
     - parameter animationDuration: set this value if you need a specific animation duration for this specific state change. If this is nil, the animation duration is taken from `defaultAnimationDuration`
     */
    open func setCornerRadius(_ radius: CGFloat, for state: UIControlState = .normal, animated: Bool = true, animationDuration: TimeInterval? = nil) {
        cornerRadii[state.rawValue] = SimpleButtonStateChangeValue(value: radius, animated: animated, animationDuration: animationDuration ?? self.defaultAnimationDuration)
        updateCornerRadius()
    }
    
    /**
     Sets the shadow color for a specific `UIControlState`
     
     - parameter color:    shadow color of button
     - parameter state:    determines at which state that shadow color applies
     - parameter animated: determines if that change in shadow color should animate. Default is `true`
     - parameter animationDuration: set this value if you need a specific animation duration for this specific state change. If this is nil, the animation duration is taken from `defaultAnimationDuration`
     */
    open func setShadowColor(_ color: UIColor, for state: UIControlState = .normal, animated: Bool = true, animationDuration: TimeInterval? = nil) {
        shadowColors[state.rawValue] = SimpleButtonStateChangeValue(value: color.cgColor, animated: animated, animationDuration: animationDuration ?? self.defaultAnimationDuration)
        updateShadowColor()
    }

    /**
     Sets the shadow opacity for a specific `UIControlState`
     
     - parameter opacity:  shadow opacity of button
     - parameter state:    determines at which state that shadow opacity applies
     - parameter animated: determines if that change in shadow opacity should animate. Default is `true`
     - parameter animationDuration: set this value if you need a specific animation duration for this specific state change. If this is nil, the animation duration is taken from `defaultAnimationDuration`
     */
    open func setShadowOpacity(_ opacity: Float, for state: UIControlState = .normal, animated: Bool = true, animationDuration: TimeInterval? = nil) {
        shadowOpacities[state.rawValue] = SimpleButtonStateChangeValue(value: opacity, animated: animated, animationDuration: animationDuration ?? self.defaultAnimationDuration)
        updateShadowOpacity()
    }

    /**
     Sets the shadow radius for a specific `UIControlState`
     
     - parameter radius:   shadow radius of button
     - parameter state:    determines at which state that shadow radius applies
     - parameter animated: determines if that change in shadow radius should animate. Default is `true`
     - parameter animationDuration: set this value if you need a specific animation duration for this specific state change. If this is nil, the animation duration is taken from `defaultAnimationDuration`
     */
    open func setShadowRadius(_ radius: CGFloat, for state: UIControlState = .normal, animated: Bool = true, animationDuration: TimeInterval? = nil) {
        shadowRadii[state.rawValue] = SimpleButtonStateChangeValue(value: radius, animated: animated, animationDuration: animationDuration ?? self.defaultAnimationDuration)
        updateShadowRadius()
    }
    
    /**
     Sets the shadow offset for a specific `UIControlState`
     
     - parameter offset:   shadow offset of button
     - parameter state:    determines at which state that shadow offset applies
     - parameter animated: determines if that change in shadow offset should animate. Default is `true`
     - parameter animationDuration: set this value if you need a specific animation duration for this specific state change. If this is nil, the animation duration is taken from `defaultAnimationDuration`
     */
    open func setShadowOffset(_ offset: CGSize, for state: UIControlState = .normal, animated: Bool = true, animationDuration: TimeInterval? = nil) {
        shadowOffsets[state.rawValue] = SimpleButtonStateChangeValue(value: offset, animated: animated, animationDuration: animationDuration ?? self.defaultAnimationDuration)
        updateShadowOffset()
    }
    
    /**
    Sets the spacing between `titleLabel` and `imageView`
    
    - parameter spacing: spacing between `titleLabel` and `imageView`
    */
    open func setTitleImageSpacing(_ spacing: CGFloat) {
        imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing / 2);
        titleEdgeInsets = UIEdgeInsetsMake(0, spacing / 2, 0, 0);
    }
    
    // MARK: Attribute update helper
    
    /**
    Updates all attributes if necessary. Each update function determines by itself if an update of any attribute is necessary. It also determines if that update should animate.
    
    - parameter lockAnimatedUpdate: set this to true to update without animation, even it´s defined in `SimpleButtonStateChange`. Used to set initial button attributes
    */
    fileprivate func update() {
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
    
    fileprivate func updateCornerRadius() {
        if let stateChange = cornerRadii[state.rawValue] ?? cornerRadii[UIControlState.normal.rawValue], stateChange.value != layer.cornerRadius {
            if stateChange.animated && !lockAnimatedUpdate {
                animate(layer: layer, from: sourceLayer.cornerRadius as AnyObject?, to: stateChange.value as AnyObject, forKey: "cornerRadius", duration: stateChange.animationDuration)
            }
            layer.cornerRadius = stateChange.value
        }
    }
    
    fileprivate func updateScale() {
        if let stateChange = buttonScales[state.rawValue] ?? buttonScales[UIControlState.normal.rawValue], transform.a != stateChange.value && transform.b != stateChange.value {
            let animations = {
                self.transform = CGAffineTransform(scaleX: stateChange.value, y: stateChange.value)
            }
            (stateChange.animated) && !lockAnimatedUpdate ? UIView.animate(withDuration: stateChange.animationDuration, animations: animations) : animations()
        }
    }
    
    fileprivate func updateBackgroundColor() {
        if let stateChange = backgroundColors[state.rawValue] ?? backgroundColors[UIControlState.normal.rawValue], layer.backgroundColor == nil || UIColor(cgColor: layer.backgroundColor!) != UIColor(cgColor: stateChange.value) {
            if stateChange.animated && !lockAnimatedUpdate {
                animate(layer: layer, from: sourceLayer.backgroundColor, to: stateChange.value, forKey: "backgroundColor", duration: stateChange.animationDuration)
            }
            layer.backgroundColor = stateChange.value
        }
    }
    
    fileprivate func updateBorderColor() {
        if let stateChange = borderColors[state.rawValue] ?? borderColors[UIControlState.normal.rawValue], layer.borderColor == nil || UIColor(cgColor: layer.borderColor!) != UIColor(cgColor: stateChange.value)  {
            if stateChange.animated && !lockAnimatedUpdate {
                animate(layer: layer, from: sourceLayer.borderColor, to: stateChange.value, forKey: "borderColor", duration: stateChange.animationDuration)
            }
            layer.borderColor = stateChange.value
        }
    }
    
    fileprivate func updateBorderWidth() {
        if let stateChange = borderWidths[state.rawValue] ?? borderWidths[UIControlState.normal.rawValue], stateChange.value != layer.borderWidth {
            if stateChange.animated && !lockAnimatedUpdate {
                animate(layer: layer, from: sourceLayer.borderWidth as AnyObject?, to: stateChange.value as AnyObject, forKey: "borderWidth", duration: stateChange.animationDuration)
            }
            layer.borderWidth = stateChange.value
        }
    }
    
    fileprivate func updateShadowOffset() {
        if let stateChange = shadowOffsets[state.rawValue] ?? shadowOffsets[UIControlState.normal.rawValue], stateChange.value != layer.shadowOffset {
            if stateChange.animated && !lockAnimatedUpdate {
                animate(layer: layer, from: NSValue(cgSize: sourceLayer.shadowOffset), to: NSValue(cgSize: stateChange.value), forKey: "shadowOffset", duration: stateChange.animationDuration)
            }
            layer.shadowOffset = stateChange.value
        }
    }
    
    fileprivate func updateShadowColor() {
        if let stateChange = shadowColors[state.rawValue] ?? shadowColors[UIControlState.normal.rawValue], layer.shadowColor == nil || UIColor(cgColor: layer.shadowColor!) != UIColor(cgColor: stateChange.value)  {
            if stateChange.animated && !lockAnimatedUpdate {
                animate(layer: layer, from: sourceLayer.shadowColor, to: stateChange.value, forKey: "shadowColor", duration: stateChange.animationDuration)
            }
            layer.shadowColor = stateChange.value
        }
    }
    
    fileprivate func updateShadowRadius() {
        if let stateChange = shadowRadii[state.rawValue] ?? shadowRadii[UIControlState.normal.rawValue], stateChange.value != layer.shadowRadius {
            if stateChange.animated && !lockAnimatedUpdate {
                animate(layer: layer, from: sourceLayer.shadowRadius as AnyObject?, to: stateChange.value as AnyObject, forKey: "shadowRadius", duration: stateChange.animationDuration)
            }
            layer.shadowRadius = stateChange.value
        }
    }
    
    fileprivate func updateShadowOpacity() {
        if let stateChange = shadowOpacities[state.rawValue] ?? shadowOpacities[UIControlState.normal.rawValue], stateChange.value != layer.shadowOpacity {
            if stateChange.animated && !lockAnimatedUpdate {
                animate(layer: layer, from: sourceLayer.shadowOpacity as AnyObject?, to: stateChange.value as AnyObject, forKey: "shadowOpacity", duration: stateChange.animationDuration)
            }
            layer.shadowOpacity = stateChange.value
        }
    }
    

    
    // MARK: Animation helper
    fileprivate func animate(layer: CALayer, from: AnyObject?, to: AnyObject, forKey key: String, duration: TimeInterval) {
        let animation = CABasicAnimation()
        animation.fromValue = from
        animation.toValue = to
        animation.duration = duration
        layer.add(animation, forKey: key)
    }
    
    // MARK: Layout
    override open func layoutSubviews() {
        super.layoutSubviews()
        loadingView?.center = CGPoint(x: bounds.size.width  / 2,
            y: bounds.size.height / 2)
    }
}
