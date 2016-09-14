# SimpleButton

![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)
[![Build Status](https://travis-ci.org/aloco/SimpleButton.svg?branch=swift-3.0)](https://travis-ci.org/aloco/SimpleButton)
![Swift 3](https://img.shields.io/badge/Swift-3-orange.svg)


UIButton subclass with animated, state-aware attributes. Easy to subclass and configure!

<center>
![Sample](Resources/example.gif)
</center>

## Usage

Just create your own `SimpleButton` subclass and configure your button attributes by overriding `configureButtonStyles`.

```swift
class PrimaryButton: SimpleButton {
    override func configureButtonStyles() {
        super.configureButtonStyles()
		setBorderWidth(4.0, for: .normal)
        setBackgroundColor(UIColor(red: 52/255, green: 73/255, blue: 94/255, alpha: 1.0), for: .normal)
        setBackgroundColor(UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0), for: .highlighted)
        setBorderColor(UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0), for: .normal)
        setScale(0.98, for: .highlighted)
        setTitleColor(UIColor.whiteColor(), for: .normal)
    }
}
```
For usage in Interfacebuilder, just use your `SimpleButton` subclass as custom class for any `UIButton` element. All defined styles gets applied automatically.

You can also configure your button without a subclass directly inline.

```swift
let awesomeButton = SimpleButton(type: .custom)
awesomeButton.setBorderWidth(2.0, for: .normal)
awesomeButton.setBorderColor(UIColor.redColor(), for: .highlighted)
view.addSubview(awesomeButton)
```
Note that you should use `UIButtonType.custom` to avoid undesired effects.

Please checkout the example project for a detailed usage demo.

#### @IBDesignable

Have a look on [DesignableButton](Example/DesignableButton.swift) subclass within the Example Project for `@IBDesignable` usage.

### Animation
Each state change of `SimpleButton` animates by default. Sometimes you need to define which state transition should animate and which should happen immediately. Therefore you can control that behaviour with the `animated` and `animationDuration` parameters. 

```
setBorderWidth(4.0, for: .normal, animated: true, animationDuration: 0.2)
setBorderWidth(8.0, for: .highlighted, animated: false)

```
This means, every state change to `.normal` animates the `borderWidth` to `4.0`. 
Every state change to `.highlighted` changes instantly the `borderWidth` to `8.0` without animation.

### Loading state

`SimpleButton` has a custom `loading` state. You can toggle this state by setting `simpleButton.isLoading`. The button shows an `UIActivityIndicator` instead of the title when adding the `loading` state.

```
simpleButton.setCornerRadius(20, for: SimpleButtonControlState.loading)
simpleButton.isLoading = true

```
If you don´t like the default loading indicator, you can set your own `UIView` by doing
```
simpleButton.loadingView = CustomAwesomeLoadingView()
```


## Configurable attributes


### scale

```swift
public func setScale(scale: CGFloat, for state: UIControlState = default, animated: Bool = default, animationDuration: TimeInterval? = default)
```

### backgroundColor

```swift
public func setBackgroundColor(color: UIColor, for state: UIControlState = default, animated: Bool = default, animationDuration: TimeInterval? = default)
```

### borderWidth

```swift
public func setBorderWidth(width: CGFloat, for state: UIControlState = default, animated: Bool = default, animationDuration: TimeInterval? = default)
```

### borderColor

```swift
public func setBorderColor(color: UIColor, for state: UIControlState = default, animated: Bool = default, animationDuration: TimeInterval? = default)
```

### cornerRadius
```swift
public func setCornerRadius(radius: CGFloat, for state: UIControlState = default, animated: Bool = default, animationDuration: TimeInterval? = default)
```

### shadowColor
```swift
public func setShadowColor(color: UIColor, for state: UIControlState = default, animated: Bool = default, animationDuration: TimeInterval? = default)
```

### shadowOpacity
```swift
public func setShadowOpacity(opacity: Float, for state: UIControlState = default, animated: Bool = default, animationDuration: TimeInterval? = default)
```

### shadowRadius
```swift
public func setShadowRadius(radius: CGFloat, for state: UIControlState = default, animated: Bool = default, animationDuration: TimeInterval? = default)
```

### shadowOffset
```swift
public func setShadowOffset(offset: CGSize, for state: UIControlState = default, animated: Bool = default, animationDuration: TimeInterval? = default)
```

## Installation

Note that SimpleButton is written in `swift 3` and may not be compatible with previous versions of swift. 


#### Carthage

Add the following line to your [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile).

```
github "aloco/SimpleButton" "swift-3.0"
```

Then run `carthage update`.

#### Manually

Just drag and drop the `SimpleButton.swift` file into  your project.


## Contributing

* Create something awesome, make the code better, add some functionality,
  whatever (this is the hardest part).
* [Fork it](http://help.github.com/forking/)
* Create new branch to make your changes
* Commit all your changes to your branch
* Submit a [pull request](http://help.github.com/pull-requests/)
