# Simple Button
![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)

Simple UIButton subclass with animated, state-aware attributes. Easy to subclass and configure!

<center>
![Sample](resources/sample.gif)
</center>

## Usage

Just make your own subclass and define your button by overriding `configure`. 

```swift

class PrimaryButton: SimpleButton {
    override func configure() {
        super.configure()
		setBorderWidth(4.0, forState: .Normal)
        setBackgroundColor(UIColor(red: 52/255, green: 73/255, blue: 94/255, alpha: 1.0), forState: .Normal)
        setBackgroundColor(UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0), forState: .Highlighted)
        setBorderColor(UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0), forState: .Normal)
        setScale(0.98, forState: .Highlighted)
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
}

```

Just use your new button within xib´s and storyboards or instantiate them from code 💥
```
let primaryButton = PrimaryButton.buttonWithType(.Custom)
```
You can also configure them on the fly
```
let awesomeButton = SimpleButton.buttonWithType(.Custom)
awesomeButton.setBorderWidth(2.0, forState: .Normal)
awesomeButton.setBorderColor(UIColor.redColor(), forState: .Highlighted)
```


## Configurable attributes


* `scale`
* `backgroundColor`
* `borderWidth`
* `borderColor`
* `cornerRadius`


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

Note that SimpleButton is written in `swift 1.2` and may not be compatible with previous versions of swift

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


