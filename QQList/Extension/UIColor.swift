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
        /// 十六进制颜色
    ///
    /// - Parameter hex: 颜色 0xFFFFFF
    public convenience init(hex: UInt) {
        let r = (hex >> 16) & 0xFF
        let g = (hex >> 8) & 0xFF
        let b = (hex) & 0xFF
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1.0)
    }
    
    /**
     生成随机色
     
     - returns: 随机色
     */
    static func randomColor() -> UIColor {
        let red: Float = Float.random(in: 0..<255)
        let green: Float = Float.random(in: 0..<255)
        let blue: Float = Float.random(in: 0..<255)
        let color = UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
        return color
    }
}
