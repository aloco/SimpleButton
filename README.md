# Simple Button

![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)
[![Build Status](https://travis-ci.org/aloco/SimpleButton.svg?branch=master)](https://travis-ci.org/aloco/SimpleButton)
![Swift 2](https://img.shields.io/badge/Swift-2-orange.svg)

Simple UIButton subclass with animated, state-aware attributes. Easy to subclass and configure!

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
For usage in Interfacebuilder, just use your `SimpleButton` subclass as custom class for each `UIButton` element. All defined styles are applied automatically.


You can also configure your button without a subclass directly inline.

```swift
let awesomeButton = SimpleButton(type:.Custom)
awesomeButton.setBorderWidth(2.0, forState: .Normal)
awesomeButton.setBorderColor(UIColor.redColor(), forState: .Highlighted)
view.addSubview(awesomeButton)
```
## Animation
Each state change of `SimpleButton` animates by default. Sometimes you need to define which state transition should animate and which should just switch immediately. Therefore you can control that behaviour with the `animated` and `animationDuration` parameters. 

```
setBorderWidth(4.0, forState: .Normal, animated: true, animationDuration: 0.2)
setBorderWidth(8.0, forState: .Highlighted, animated: false)

```
This means, each state change to `.Normal` animates the `borderWidth` to `4.0` and each state change to `.Highlighted` changes instantly the `borderWidth` to `8.0` without animation.

## Loading state

`SimpleButton` adds his own `.Loading` state. You can toggle the state by setting `simpleButton.isLoading` to `true` or `false`. The button also shows an `UIActivityIndicator` instead of the title when switching into `.Loading`

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
simpleButton.setScale(0.98, forState: .Highlighted)
simpleButton.setScale(0.80, forState: .Disabled)
```

### backgroundColor

```swift
simpleButton.setBackgroundColor(UIColor(red: 52/255, green: 73/255, blue: 94/255, alpha: 1.0), forState: .Normal)
simpleButton.setBackgroundColor(UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0), forState: .Highlighted)
simpleButton.setBackgroundColor(UIColor.grayColor(), forState: .Disabled)
```

### borderWidth

```swift
simpleButton.setBorderWidth(4.0, forState: .Normal)
simpleButton.setBorderWidth(2.0, forState: .Highlighted)
```

### borderColor

```swift
simpleButton.setBorderWidth(4.0, forState: .Normal)
simpleButton.setBorderColor(UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1.0), forState: .Normal)
simpleButton.setBorderColor(UIColor(red: 149/255, green: 165/255, blue: 166/255, alpha: 1.0), forState: .Highlighted)
```

### cornerRadius
```swift
simpleButton.setCornerRadius(10, forState: .Normal)
simpleButton.setCornerRadius(20, forState: .Highlighted)
```

## Installation

Note that SimpleButton is written in `swift 2.0` and may not be compatible with previous versions of swift. 


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
