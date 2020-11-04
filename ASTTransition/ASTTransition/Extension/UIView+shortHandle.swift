//
//  UIView+shortHandle.swift
//  ASTTransition
//
//  Created by ShevaKuilin on 2020/11/2.
//  Copyright © 2020 ShevaKuilin. All rights reserved.
//

import UIKit
import Foundation

extension Collection where Iterator.Element == Int {
    public var color: UIColor {
        assert(self.count == 3, "You should specify R,G,B values with 3 integers")
        let r = CGFloat(self[startIndex]) / CGFloat(255)
        let g = CGFloat(self[index(startIndex, offsetBy: 1)]) / CGFloat(255)
        let b = CGFloat(self[index(startIndex, offsetBy: 2)]) / CGFloat(255)
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    public var font: UIFont {
        assert(self.count == 1, "You only specify size value with 1 integers")
        let size = CGFloat(self[startIndex])
        return UIFont.systemFont(ofSize: size)
    }
    
    public var boldFont: UIFont {
        assert(self.count == 1, "You only specify size value with 1 integers")
        let size = CGFloat(self[startIndex])
        return UIFont.boldSystemFont(ofSize: size)
    }
}

extension Collection where Iterator.Element == CGFloat {
    public var frame: CGRect {
        assert(self.count == 4, "You should specify x,y,width,height values with 4 integers")
        let x = CGFloat(self[startIndex])
        let y = CGFloat(self[index(startIndex, offsetBy: 1)])
        let w = CGFloat(self[index(startIndex, offsetBy: 2)])
        let h = CGFloat(self[index(startIndex, offsetBy: 3)])
        return CGRect(x: x, y: y, width: w, height: h)
    }
}

extension Collection where Iterator.Element == String {
    public var image: UIImage {
        assert(self.count == 1, "You only specify name value with 1 string")
        return UIImage(named: self[startIndex]) ?? UIImage(named: "")!
    }
}
