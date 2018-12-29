//
//  SimpleButtonControlState.swift
//  Example
//
//  Created by Andreas Tinoco Lobo on 03/11/15.
//  Copyright © 2015 Andreas Tinoco Lobo. All rights reserved.
//

import Foundation

/**
 *  Custom SimpleButton control state
 */
public struct SimpleButtonControlState {
    /// Indicates loading state of SimpleButton
    public static let loading: UIControl.State = UIControl.State(rawValue: 1 << 16)
}
