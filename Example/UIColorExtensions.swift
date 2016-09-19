//
//  UIColorExtensions.swift
//
//  Created by Mihails Tumkins on 10/02/15.
//

import UIKit

extension UIColor {
    convenience init(r: Int, g:Int, b:Int) {
        self.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
    }
    
    class func turquoiseColor()->UIColor {
        return UIColor(r: 26, g: 188, b: 156)
    }
    
    class func greenSeaColor()->UIColor {
        return UIColor(r: 22, g: 160, b: 133)
    }
    
    class func emeraldColor()->UIColor {
        return UIColor(r: 46, g: 204, b: 113)
    }
    
    class func nephritisColor()->UIColor {
        return UIColor(r: 39, g: 174, b: 96)
    }
    
    class func peterRiverColor()->UIColor {
        return UIColor(r: 52, g: 152, b: 219)
    }
    
    class func belizeHoleColor()->UIColor {
        return UIColor(r: 41, g: 128, b: 185)
    }
    
    class func amethystColor()->UIColor {
        return UIColor(r:155, g:89, b:182)
    }
    
    class func wisteriaColor()->UIColor {
        return UIColor(r:142, g:68, b:173)
    }
    
    class func wetAsphaltColor()->UIColor {
        return UIColor(r:52, g:73, b:94)
    }
    
    class func midnightBlueColor()->UIColor {
        return UIColor(r:44, g:62, b:80)
    }
    
    class func sunflowerColor()->UIColor {
        return UIColor(r:241, g:196, b:15)
    }
    
    class func carrotColor()->UIColor {
        return UIColor(r:230, g:126, b:34)
    }
    
    class func pumpkinColor()->UIColor {
        return UIColor(r:211, g:84, b:0)
    }
    
    class func alizarinColor()->UIColor {
        return UIColor(r:231, g:76, b:60)
    }
    
    class func pomergranateColor()->UIColor {
        return UIColor(r:192, g:57, b:43)
    }
    
    class func cloudsColor()->UIColor {
        return UIColor(r:236, g:240, b:241)
    }
    
    class func silverColor()->UIColor {
        return UIColor(r:189, g:195, b:199)
    }
    
    class func concreteColor()->UIColor {
        return UIColor(r:149, g:165, b:166)
    }
    
    class func asbestosColor()->UIColor {
        return UIColor(r:127, g:140, b:141)
    }
    
}
