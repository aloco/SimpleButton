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
        let button = SimpleButton(type: .custom)
        
        button.setBackgroundColor(UIColor.red)
        XCTAssertEqual(button.backgroundColor, UIColor.red, "backgroundColor doesn't match")
    }
    
    func testSetBackgroundColorStateChange() {
        let button = SimpleButton(type: .custom)
        
        button.setBackgroundColor(UIColor.green, for: .normal, animated: true)
        button.isEnabled = true
        
        XCTAssertEqual(button.backgroundColor, UIColor.green, "enabled backgroundColor doesn't match set color")
        
        button.setBackgroundColor(UIColor.red, for: .disabled, animated: true)
        button.isEnabled = false
        
        XCTAssertEqual(button.backgroundColor, UIColor.red, "disabled backgroundColor doesn't match set color")
    }
    
    
    // MARK: BorderColor
    
    func testBorderColor() {
        let button = SimpleButton(type: .custom)
        
        button.setBorderColor(UIColor.red)
        
        XCTAssertEqual(UIColor(cgColor: button.layer.borderColor!), UIColor.red, "borderColor doesn't match")
    }
    
    func testBorderColorWithStateChange() {
        let button = SimpleButton(type: .custom)
        
        button.setBorderColor(UIColor.green, for: .normal, animated: true)
        button.isEnabled = true
        
        XCTAssertEqual(UIColor(cgColor: button.layer.borderColor!), UIColor.green, "enabled borderColor doesn't match")
        
        button.setBorderColor(UIColor.red, for: .disabled, animated: true)
        button.isEnabled = false
        
        XCTAssertEqual(UIColor(cgColor: button.layer.borderColor!), UIColor.red, "disabled borderColor doesn't match")
    }
    
    
    // MARK: BorderWidth
    
    func testBorderWidthWithStateChange() {
        let button = SimpleButton(type: .custom)
        
        button.setBorderWidth(1.0)
        button.setBorderWidth(0.5, for: .highlighted, animated: true)
        
        let unhighlightedWidth = button.layer.borderWidth;
        
        button.isHighlighted = true
        let highlightedWidth = button.layer.borderWidth;
        
        XCTAssertEqual(unhighlightedWidth, 1.0, "unhighlightedWidth doesn't macth expected width of 1.0")
        XCTAssertEqual(highlightedWidth, 0.5, "highlightedWidth doesn't macth expected width of 0.5")
    }
    
    
    // MARK: CornerRadius
    
    func testSetCornerRadius() {
        let button = SimpleButton(type: .custom)
        
        button.setCornerRadius(2.0)
        
        XCTAssertEqual(button.layer.cornerRadius, 2.0, "corderRadius doesn't match")
    }
    
    func testSetCornerRadiusWithStateChange() {
        let button = SimpleButton(type: .custom)

        button.setCornerRadius(4.0, for: .normal, animated: true)
        button.isEnabled = true
        
        XCTAssertEqual(button.layer.cornerRadius, 4.0, "enabled corderRadius doesn't match")
        
        button.setCornerRadius(2.0, for: .disabled, animated: true)
        button.isEnabled = false
        
        XCTAssertEqual(button.layer.cornerRadius, 2.0, "corderRadius doesn't match")
    }
    
    
    // MARK: Scale
    
    func testSetScale() {
        let button = SimpleButton(type: .custom)
        
        let originalScale = button.frame.height
        button.setScale(0.5)
        let halfSizeScale = button.frame.height
        
        XCTAssertEqual(originalScale * 0.5, halfSizeScale, "halfSizeScale scale doesn't match originalScale * 0.5")
    }
    
    func testScaleWithStateChange() {
        let button = SimpleButton(type: .custom)
        
        button.setScale(0.5, for: .selected, animated: true)
        let unselectedSize = button.frame.height
        
        button.isSelected = true
        let selectedSize = button.frame.height
        
        XCTAssertEqual(unselectedSize * 0.5, selectedSize, "selected scale doesn't match unselected scale * 0.5")
    }
    
    // MARK: ShadowColor
    
    func testSetShadowColor() {
        let button = SimpleButton(type: .custom)
        
        button.setShadowColor(UIColor.red, for: .normal, animated: true)
        XCTAssertEqual(UIColor(cgColor: button.layer.shadowColor ?? UIColor.blue.cgColor), UIColor.red, "shadowColor doesn't match")
    }
    
    func testSetShadowColorStateChange() {
        let button = SimpleButton(type: .custom)
        
        button.setShadowColor(UIColor.green, for: .normal, animated: true)
        button.isEnabled = true
        
        XCTAssertEqual(UIColor(cgColor: button.layer.shadowColor ?? UIColor.blue.cgColor), UIColor.green, "enabled backgroundColor doesn't match set color")
        
        button.setShadowColor(UIColor.red, for: .disabled, animated: true)
        button.isEnabled = false
        
        XCTAssertEqual(UIColor(cgColor: button.layer.shadowColor ?? UIColor.blue.cgColor), UIColor.red, "disabled backgroundColor doesn't match set color")
    }
    
    // MARK: ShadowOffset
    
    func testSetShadowOffset() {
        let button = SimpleButton(type: .custom)
        let offset = CGSize(width: 10, height: 10)
        button.setShadowOffset(offset, for: .normal, animated: true)
        XCTAssertEqual(offset, button.layer.shadowOffset, "shadowOffset doesn't match")
    }
    
    func testSetShadowOffsetStateChange() {
        
        let button = SimpleButton(type: .custom)
        let offset = CGSize(width: 10, height: 10)
        button.setShadowOffset(offset, for: .normal, animated: true)
        XCTAssertEqual(offset, button.layer.shadowOffset, "shadowOffset doesn't match")
        
        let newOffset = CGSize(width: 2, height: 3)
        button.setShadowOffset(newOffset, for: .disabled, animated: true)
        button.isEnabled = false
        
        XCTAssertEqual(newOffset, button.layer.shadowOffset, "disabled shadowOffset doesn't match")
    }
    
    // MARK: ShadowRadius
    
    func testSetShadowRadius() {
        let button = SimpleButton(type: .custom)
        let offset = CGSize(width: 10, height: 10)
        button.setShadowOffset(offset, for: .normal, animated: true)
        XCTAssertEqual(offset, button.layer.shadowOffset, "shadowOffset doesn't match")
    }
    
    func testSetShadowRadiusStateChange() {
        
        let button = SimpleButton(type: .custom)

        button.setShadowRadius(10, for: .normal, animated: true)
        XCTAssertEqual(10, button.layer.shadowRadius, "shadowRadius doesn't match")
        
        button.setShadowRadius(2, for: .disabled, animated: true)
        button.isEnabled = false
        
        XCTAssertEqual(2, button.layer.shadowRadius, "disabled shadowRadius doesn't match")
    }
    
    // MARK: ShadowOpacity
    
    func testSetShadowOpacity() {
        let button = SimpleButton(type: .custom)
        let offset = CGSize(width: 10, height: 10)
        button.setShadowOffset(offset, for: .normal, animated: true)
        XCTAssertEqual(offset, button.layer.shadowOffset, "shadowOffset doesn't match")
    }
    
    func testSetShadowOpacityStateChange() {
        
        let button = SimpleButton(type: .custom)
        
        button.setShadowOpacity(1, for: .normal, animated: true)
        XCTAssertEqual(1, button.layer.shadowOpacity, "shadowOpacity doesn't match")
        
        button.setShadowOpacity(0.5, for: .disabled, animated: true)
        button.isEnabled = false
        
        XCTAssertEqual(0.5, button.layer.shadowOpacity, "disabled shadowOpacity doesn't match")
    }
    
    // MARK: EdgeCases
    
    func testChangeStateBackgroundColorWithoutStateChange() {
        let button = SimpleButton(type: .custom)
        
        button.setBackgroundColor(UIColor.green, for: .normal, animated: true)
        XCTAssertEqual(button.backgroundColor, UIColor.green, "backgorundColor doesn't match")
        
        button.setBackgroundColor(UIColor.red, for: .normal, animated: true)
        XCTAssertEqual(button.backgroundColor, UIColor.red, "backgorundColor doesn't match")
    }
    
    // MARK: StateChange tests
    
    func testStateChange() {
        let button = SimpleButton(type: .custom)
        
        XCTAssertEqual(button.state, UIControlState.normal, "state should be set to Normal")
        
        button.isHighlighted = true
        XCTAssertEqual(button.state, UIControlState.highlighted, "state should be set to Highlighted")
        
        button.isEnabled = false
        print(button.state)
        XCTAssert(button.state.contains(.highlighted), "state should contain highlighted")
        
        button.isLoading = true
        print(button.state)
        XCTAssert(button.state.contains(SimpleButtonControlState.loading), "state should contain Loading")
    }
    
    // MARK: Check correct enable / disable of userInteractionEnabled
    
    func testUserInteractionEnabled() {
        let button = SimpleButton(type: .custom)
        
        button.isEnabled = false
        XCTAssert(button.isUserInteractionEnabled == false, "userInteractionEnabled should be set to false")

        button.isEnabled = true
        XCTAssert(button.isUserInteractionEnabled == true, "userInteractionEnabled should be set to true")
        
        button.isLoading = true
        XCTAssert(button.isUserInteractionEnabled == false, "userInteractionEnabled should be set to false")

        button.isLoading = false
        XCTAssert(button.isUserInteractionEnabled == true, "userInteractionEnabled should be set to true")
        
        
        button.isLoading = true
        button.isEnabled = true
        XCTAssert(button.isUserInteractionEnabled == false, "userInteractionEnabled should be set to false")

        button.isEnabled = false
        button.isLoading = false
        XCTAssert(button.isUserInteractionEnabled == false, "userInteractionEnabled should be set to false")
        
        button.isLoading = false
        button.isEnabled = true
        XCTAssert(button.isUserInteractionEnabled == true, "userInteractionEnabled should be set to true")
        
        button.isLoading = true
        button.isEnabled = false
        XCTAssert(button.isUserInteractionEnabled == false, "userInteractionEnabled should be set to false")
        
        
        button.isLoading = true
        button.isEnabled = false
        button.isLoading = false
        XCTAssert(button.isUserInteractionEnabled == false, "userInteractionEnabled should be set to false")
        
        button.isLoading = false
        button.isEnabled = true
        button.isLoading = true
        XCTAssert(button.isUserInteractionEnabled == false, "userInteractionEnabled should be set to false")
        
        button.isEnabled = false
        button.isLoading = false
        button.isEnabled = true
        XCTAssert(button.isUserInteractionEnabled == true, "userInteractionEnabled should be set to true")
        
        button.isEnabled = true
        button.isLoading = true
        button.isEnabled = false
        XCTAssert(button.isUserInteractionEnabled == false, "userInteractionEnabled should be set to false")
    }
}
