//
//  SimpleButtonStateChangeValue.swift
//  Example
//
//  Created by Andreas Tinoco Lobo on 03/11/15.
//  Copyright © 2015 Andreas Tinoco Lobo. All rights reserved.
//

import Foundation
/**
 *  defines whether state transition to a given value should animate and at which speed
 */
struct SimpleButtonStateChangeValue<T> {
    let value: T
    let animated: Bool
    let animationDuration: TimeInterval
}
