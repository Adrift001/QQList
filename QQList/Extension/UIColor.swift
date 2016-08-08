//
//  UIColor.swift
//  MeBase
//
//  Created by Adrift on 16/6/25.
//  Copyright © 2016年 Adrift. All rights reserved.
//

import UIKit

extension UIColor {
    
    /**
     十六进制->UIColor
     
     - parameter hexString: 十六进制字符
     
     - returns: 十六进制对应的颜色
     */
    static func hexStringToColor(hexString: String) -> UIColor{
        var cString: String = hexString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        if cString.characters.count < 6 { return UIColor.blackColor() }
        if cString.hasPrefix("0X") { cString = cString.substringFromIndex(cString.startIndex.advancedBy(2)) }
        if cString.hasPrefix("#") { cString = cString.substringFromIndex(cString.startIndex.advancedBy(1)) }
        if cString.characters.count != 6 { return UIColor.blackColor() }
        
        var range: NSRange = NSMakeRange(0, 2)
        
        let rString = (cString as NSString).substringWithRange(range)
        range.location = 2
        let gString = (cString as NSString).substringWithRange(range)
        range.location = 4
        let bString = (cString as NSString).substringWithRange(range)
        
        var r: UInt32 = 0x0
        var g: UInt32 = 0x0
        var b: UInt32 = 0x0
        NSScanner.init(string: rString).scanHexInt(&r)
        NSScanner.init(string: gString).scanHexInt(&g)
        NSScanner.init(string: bString).scanHexInt(&b)
        
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(1))
        
    }
    
    /**
     生成随机色
     
     - returns: 随机色
     */
    static func randomColor() -> UIColor {
        let red: Float = Float(random()) % 255
        let green: Float = Float(random()) % 255
        let blue: Float = Float(random()) % 255
        let color = UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
        return color
    }
}
