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
        let button = SimpleButton(type: .Custom)
        
        button.setBackgroundColor(UIColor.redColor())
        XCTAssertEqual(button.backgroundColor, UIColor.redColor(), "backgroundColor doesn't match")
    }
    
    func testSetBackgroundColorStateChange() {
        let button = SimpleButton(type: .Custom)
        
        button.setBackgroundColor(UIColor.greenColor(), forState: .Normal, animated: true)
        button.enabled = true
        
        XCTAssertEqual(button.backgroundColor, UIColor.greenColor(), "enabled backgroundColor doesn't match set color")
        
        button.setBackgroundColor(UIColor.redColor(), forState: .Disabled, animated: true)
        button.enabled = false
        
        XCTAssertEqual(button.backgroundColor, UIColor.redColor(), "disabled backgroundColor doesn't match set color")
    }
    
    
    // MARK: BorderColor
    
    func testBorderColor() {
        let button = SimpleButton(type: .Custom)
        
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
        let button = SimpleButton(type: .Custom)
        
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
        let button = SimpleButton(type: .Custom)
        
        button.setCornerRadius(2.0)
        
        XCTAssertEqual(button.layer.cornerRadius, 2.0, "corderRadius doesn't match")
    }
    
    func testSetCornerRadiusWithStateChange() {
        let button = SimpleButton(type: .Custom)

        button.setCornerRadius(4.0, forState: .Normal, animated: true)
        button.enabled = true
        
        XCTAssertEqual(button.layer.cornerRadius, 4.0, "enabled corderRadius doesn't match")
        
        button.setCornerRadius(2.0, forState: .Disabled, animated: true)
        button.enabled = false
        
        XCTAssertEqual(button.layer.cornerRadius, 2.0, "corderRadius doesn't match")
    }
    
    
    // MARK: Scale
    
    func testSetScale() {
        let button = SimpleButton(type: .Custom)
        
        let originalScale = CGRectGetHeight(button.frame)
        button.setScale(0.5)
        let halfSizeScale = CGRectGetHeight(button.frame)
        
        XCTAssertEqual(originalScale * 0.5, halfSizeScale, "halfSizeScale scale doesn't match originalScale * 0.5")
    }
    
    func testScaleWithStateChange() {
        let button = SimpleButton(type: .Custom)
        
        button.setScale(0.5, forState: .Selected, animated: true)
        let unselectedSize = CGRectGetHeight(button.frame)
        
        button.selected = true
        let selectedSize = CGRectGetHeight(button.frame)
        
        XCTAssertEqual(unselectedSize * 0.5, selectedSize, "selected scale doesn't match unselected scale * 0.5")
    }
    
    // MARK: ShadowColor
    
    func testSetShadowColor() {
        let button = SimpleButton(type: .Custom)
        
        button.setShadowColor(UIColor.redColor(), forState: .Normal, animated: true)
        XCTAssertEqual(UIColor(CGColor: button.layer.shadowColor ?? UIColor.blueColor().CGColor), UIColor.redColor(), "shadowColor doesn't match")
    }
    
    func testSetShadowColorStateChange() {
        let button = SimpleButton(type: .Custom)
        
        button.setShadowColor(UIColor.greenColor(), forState: .Normal, animated: true)
        button.enabled = true
        
        XCTAssertEqual(UIColor(CGColor: button.layer.shadowColor ?? UIColor.blueColor().CGColor), UIColor.greenColor(), "enabled backgroundColor doesn't match set color")
        
        button.setShadowColor(UIColor.redColor(), forState: .Disabled, animated: true)
        button.enabled = false
        
        XCTAssertEqual(UIColor(CGColor: button.layer.shadowColor ?? UIColor.blueColor().CGColor), UIColor.redColor(), "disabled backgroundColor doesn't match set color")
    }
    
    // MARK: ShadowOffset
    
    func testSetShadowOffset() {
        let button = SimpleButton(type: .Custom)
        let offset = CGSize(width: 10, height: 10)
        button.setShadowOffset(offset, forState: .Normal, animated: true)
        XCTAssertEqual(offset, button.layer.shadowOffset, "shadowOffset doesn't match")
    }
    
    func testSetShadowOffsetStateChange() {
        
        let button = SimpleButton(type: .Custom)
        let offset = CGSize(width: 10, height: 10)
        button.setShadowOffset(offset, forState: .Normal, animated: true)
        XCTAssertEqual(offset, button.layer.shadowOffset, "shadowOffset doesn't match")
        
        let newOffset = CGSize(width: 2, height: 3)
        button.setShadowOffset(newOffset, forState: .Disabled, animated: true)
        button.enabled = false
        
        XCTAssertEqual(newOffset, button.layer.shadowOffset, "disabled shadowOffset doesn't match")
    }
    
    // MARK: ShadowRadius
    
    func testSetShadowRadius() {
        let button = SimpleButton(type: .Custom)
        let offset = CGSize(width: 10, height: 10)
        button.setShadowOffset(offset, forState: .Normal, animated: true)
        XCTAssertEqual(offset, button.layer.shadowOffset, "shadowOffset doesn't match")
    }
    
    func testSetShadowRadiusStateChange() {
        
        let button = SimpleButton(type: .Custom)

        button.setShadowRadius(10, forState: .Normal, animated: true)
        XCTAssertEqual(10, button.layer.shadowRadius, "shadowRadius doesn't match")
        
        button.setShadowRadius(2, forState: .Disabled, animated: true)
        button.enabled = false
        
        XCTAssertEqual(2, button.layer.shadowRadius, "disabled shadowRadius doesn't match")
    }
    
    // MARK: ShadowOpacity
    
    func testSetShadowOpacity() {
        let button = SimpleButton(type: .Custom)
        let offset = CGSize(width: 10, height: 10)
        button.setShadowOffset(offset, forState: .Normal, animated: true)
        XCTAssertEqual(offset, button.layer.shadowOffset, "shadowOffset doesn't match")
    }
    
    func testSetShadowOpacityStateChange() {
        
        let button = SimpleButton(type: .Custom)
        
        button.setShadowOpacity(1, forState: .Normal, animated: true)
        XCTAssertEqual(1, button.layer.shadowOpacity, "shadowOpacity doesn't match")
        
        button.setShadowOpacity(0.5, forState: .Disabled, animated: true)
        button.enabled = false
        
        XCTAssertEqual(0.5, button.layer.shadowOpacity, "disabled shadowOpacity doesn't match")
    }
    
    // MARK: EdgeCases
    
    func testChangeStateBackgroundColorWithoutStateChange() {
        let button = SimpleButton(type: .Custom)
        
        button.setBackgroundColor(UIColor.greenColor(), forState: .Normal, animated: true)
        XCTAssertEqual(button.backgroundColor, UIColor.greenColor(), "backgorundColor doesn't match")
        
        button.setBackgroundColor(UIColor.redColor(), forState: .Normal, animated: true)
        XCTAssertEqual(button.backgroundColor, UIColor.redColor(), "backgorundColor doesn't match")
    }
    
    // MARK: StateChange tests
    
    func testStateChange() {
        let button = SimpleButton(type: .Custom)
        
        XCTAssertEqual(button.state, UIControlState.Normal, "state should be set to Normal")
        
        button.highlighted = true
        XCTAssertEqual(button.state, UIControlState.Highlighted, "state should be set to Highlighted")
        
        button.enabled = false
        print(button.state)
        XCTAssert(button.state.contains(.Highlighted), "state should contain highlighted")
        
        button.loading = true
        print(button.state)
        XCTAssert(button.state.contains(SimpleButtonControlState.Loading), "state should contain Loading")
    }
    
    // MARK: Check correct enable / disable of userInteractionEnabled
    
    func testUserInteractionEnabled() {
        let button = SimpleButton(type: .Custom)
        
        button.enabled = false
        XCTAssert(button.userInteractionEnabled == false, "userInteractionEnabled should be set to false")

        button.enabled = true
        XCTAssert(button.userInteractionEnabled == true, "userInteractionEnabled should be set to true")
        
        button.loading = true
        XCTAssert(button.userInteractionEnabled == false, "userInteractionEnabled should be set to false")

        button.loading = false
        XCTAssert(button.userInteractionEnabled == true, "userInteractionEnabled should be set to true")
        
        
        button.loading = true
        button.enabled = true
        XCTAssert(button.userInteractionEnabled == false, "userInteractionEnabled should be set to false")

        button.enabled = false
        button.loading = false
        XCTAssert(button.userInteractionEnabled == false, "userInteractionEnabled should be set to false")
        
        button.loading = false
        button.enabled = true
        XCTAssert(button.userInteractionEnabled == true, "userInteractionEnabled should be set to true")
        
        button.loading = true
        button.enabled = false
        XCTAssert(button.userInteractionEnabled == false, "userInteractionEnabled should be set to false")
        
        
        button.loading = true
        button.enabled = false
        button.loading = false
        XCTAssert(button.userInteractionEnabled == false, "userInteractionEnabled should be set to false")
        
        button.loading = false
        button.enabled = true
        button.loading = true
        XCTAssert(button.userInteractionEnabled == false, "userInteractionEnabled should be set to false")
        
        button.enabled = false
        button.loading = false
        button.enabled = true
        XCTAssert(button.userInteractionEnabled == true, "userInteractionEnabled should be set to true")
        
        button.enabled = true
        button.loading = true
        button.enabled = false
        XCTAssert(button.userInteractionEnabled == false, "userInteractionEnabled should be set to false")
    }
}
