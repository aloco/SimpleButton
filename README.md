# SimpleButton

![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)
[![Build Status](https://travis-ci.org/aloco/SimpleButton.svg?branch=master)](https://travis-ci.org/aloco/SimpleButton)
![Swift 2](https://img.shields.io/badge/Swift-2.1-orange.svg)

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
		setBorderWidth(4.0, forState: .Normal)
        setBackgroundColor(UIColor(red: 52/255, green: 73/255, blue: 94/255, alpha: 1.0), forState: .Normal)
        setBackgroundColor(UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0), forState: .Highlighted)
        setBorderColor(UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0), forState: .Normal)
        setScale(0.98, forState: .Highlighted)
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
}
```
For usage in Interfacebuilder, just use your `SimpleButton` subclass as custom class for any `UIButton` element. All defined styles gets applied automatically.


You can also configure your button without a subclass directly inline.

```swift
let awesomeButton = SimpleButton(type: .Custom)
awesomeButton.setBorderWidth(2.0, forState: .Normal)
awesomeButton.setBorderColor(UIColor.redColor(), forState: .Highlighted)
view.addSubview(awesomeButton)
```
Please checkout the example project for a detailed usage demo.
### Animation
Each state change of `SimpleButton` animates by default. Sometimes you need to define which state transition should animate and which should happen immediately. Therefore you can control that behaviour with the `animated` and `animationDuration` parameters. 

```
setBorderWidth(4.0, forState: .Normal, animated: true, animationDuration: 0.2)
setBorderWidth(8.0, forState: .Highlighted, animated: false)

```
This means, every state change to `.Normal` animates the `borderWidth` to `4.0`. 
Every state change to `.Highlighted` changes instantly the `borderWidth` to `8.0` without animation.

### Loading state

`SimpleButton` has a custom `.Loading` state. You can toggle this state by setting `simpleButton.isLoading`. The button shows an `UIActivityIndicator` instead of the title when adding the `.Loading` state.

```
simpleButton.setCornerRadius(20, forState: .Loading)
simpleButton.isLoading = true

```
If you don´t like the default loading indicator, you can set your own `UIView` by doing
```
simpleButton.loadingView = CustomAwesomeLoadingView()
```


## Configurable attributes


### scale

```swift
public func setScale(scale: CGFloat, forState state: UIControlState = default, animated: Bool = default, animationDuration: NSTimeInterval? = default)
```

### backgroundColor

```swift
public func setBackgroundColor(color: UIColor, forState state: UIControlState = default, animated: Bool = default, animationDuration: NSTimeInterval? = default)
```

### borderWidth

```swift
public func setBorderWidth(width: CGFloat, forState state: UIControlState = default, animated: Bool = default, animationDuration: NSTimeInterval? = default)
```

### borderColor

```swift
public func setBorderColor(color: UIColor, forState state: UIControlState = default, animated: Bool = default, animationDuration: NSTimeInterval? = default)
```

### cornerRadius
```swift
public func setCornerRadius(radius: CGFloat, forState state: UIControlState = default, animated: Bool = default, animationDuration: NSTimeInterval? = default)
```

### shadowColor
```swift
public func setShadowColor(color: UIColor, forState state: UIControlState = default, animated: Bool = default, animationDuration: NSTimeInterval? = default)
```

### shadowOpacity
```swift
public func setShadowOpacity(opacity: Float, forState state: UIControlState = default, animated: Bool = default, animationDuration: NSTimeInterval? = default)
```

### shadowRadius
```swift
public func setShadowRadius(radius: CGFloat, forState state: UIControlState = default, animated: Bool = default, animationDuration: NSTimeInterval? = default)
```

### shadowOffset
```swift
public func setShadowOffset(offset: CGSize, forState state: UIControlState = default, animated: Bool = default, animationDuration: NSTimeInterval? = default)
```

## Installation

Note that SimpleButton is written in `swift 2.1` and may not be compatible with previous versions of swift. 


#### Carthage

Add the following line to your [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile).

```
github "aloco/SimpleButton"
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
