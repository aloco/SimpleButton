//
//  SimpleButtonTests.swift
//  SimpleButtonTests
//
//  Created by Alexander Schuch on 14/04/15.
//  Copyright (c) 2015 Andreas Tinoco Lobo. All rights reserved.
//

import UIKit
import XCTest

import SimpleButton

class SimpleButtonTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    // MARK: BackgroundColor
    
    func testSetBackgroundColor() {
        // This is an example of a functional test case.
        let button = SimpleButton()
        
        button.setBackgroundColor(UIColor.redColor())
        XCTAssertEqual(button.backgroundColor, UIColor.redColor(), "backgroundColor doesn't match")
    }
    
    func testSetBackgroundColorStateChange() {
        let button = SimpleButton()
        
        button.setBackgroundColor(UIColor.greenColor(), forState: .Normal, animated: true)
        button.enabled = true
        
        XCTAssertEqual(button.backgroundColor, UIColor.greenColor(), "disabled backgroundColor doesn't match set color")
        
        button.setBackgroundColor(UIColor.redColor(), forState: .Disabled, animated: true)
        button.enabled = false
        
        XCTAssertEqual(button.backgroundColor, UIColor.redColor(), "disabled backgroundColor doesn't match set color")
    }
    
    
    // MARK: BorderColor
    
    func testBorderColor() {
        let button = SimpleButton()
        
        button.setBorderColor(UIColor.redColor())
        
        XCTAssertEqual(UIColor(CGColor: button.layer.borderColor!), UIColor.redColor(), "borderColor doesn't match")
    }
    
    func testBorderColorWithStateChange() {
        let button = SimpleButton()
        
        button.setBorderColor(UIColor.greenColor(), forState: .Normal, animated: true)
        button.enabled = true
        
        XCTAssertEqual(UIColor(CGColor: button.layer.borderColor!), UIColor.greenColor(), "enabled borderColor doesn't match")
        
        button.setBorderColor(UIColor.redColor(), forState: .Disabled, animated: true)
        button.enabled = false
        
        XCTAssertEqual(UIColor(CGColor: button.layer.borderColor!), UIColor.redColor(), "disabled borderColor doesn't match")
    }
    
    
    // MARK: BorderWidth
    
    func testBorderWidthWithStateChange() {
        let button = SimpleButton()
        
        button.setBorderWidth(1.0)
        button.setBorderWidth(0.5, forState: .Highlighted, animated: true)
        
        let unhighlightedWidth = button.layer.borderWidth;
        
        button.highlighted = true
        let highlightedWidth = button.layer.borderWidth;
        
        XCTAssertEqual(unhighlightedWidth, 1.0, "unhighlightedWidth doesn't macth expected width of 1.0")
        XCTAssertEqual(highlightedWidth, 0.5, "highlightedWidth doesn't macth expected width of 0.5")
    }
    
    
    // MARK: CornerRadius
    
    func testSetCornerRadius() {
        let button = SimpleButton()
        
        button.setCornerRadius(2.0)
        
        XCTAssertEqual(button.layer.cornerRadius, 2.0, "corderRadius doesn't match")
    }
    
    func testSetCornerRadiusWithStateChange() {
        let button = SimpleButton()

        button.setCornerRadius(4.0, forState: .Normal, animated: true)
        button.enabled = true
        
        XCTAssertEqual(button.layer.cornerRadius, 4.0, "enabled corderRadius doesn't match")
        
        button.setCornerRadius(2.0, forState: .Disabled, animated: true)
        button.enabled = false
        
        XCTAssertEqual(button.layer.cornerRadius, 2.0, "corderRadius doesn't match")
    }
    
    
    // MARK: Scale
    
    func testSetScale() {
        let button = SimpleButton()
        
        let originalScale = CGRectGetHeight(button.frame)
        button.setScale(0.5)
        let halfSizeScale = CGRectGetHeight(button.frame)
        
        XCTAssertEqual(originalScale * 0.5, halfSizeScale, "halfSizeScale scale doesn't match originalScale * 0.5")
    }
    
    func testScaleWithStateChange() {
        let button = SimpleButton()
        
        button.setScale(0.5, forState: .Selected, animated: true)
        let unselectedSize = CGRectGetHeight(button.frame)
        
        button.selected = true
        let selectedSize = CGRectGetHeight(button.frame)
        
        XCTAssertEqual(unselectedSize * 0.5, selectedSize, "selected scale doesn't match unselected scale * 0.5")
    }
    
    
    // MARK: EdgeCases
    
    func testChangeStateBackgroundColorWithoutStateChange() {
        let button = SimpleButton()
        
        button.setBackgroundColor(UIColor.greenColor(), forState: .Normal, animated: true)
        XCTAssertEqual(button.backgroundColor, UIColor.greenColor(), "backgorundColor doesn't match")
        
        button.setBackgroundColor(UIColor.redColor(), forState: .Normal, animated: true)
        XCTAssertEqual(button.backgroundColor, UIColor.redColor(), "backgorundColor doesn't match")
    }
}
