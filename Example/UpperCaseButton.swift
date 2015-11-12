//
//  UpperCaseButton.swift
//  Example
//
//  Created by Andreas Tinoco Lobo on 05.04.15.
//  Copyright (c) 2015 Andreas Tinoco Lobo. All rights reserved.
//

import SimpleButton

class UpperCaseButton: SimpleButton {

    override func setTitle(title: String?, forState state: UIControlState) {
        super.setTitle(title?.uppercaseString, forState: state)
    }
}
