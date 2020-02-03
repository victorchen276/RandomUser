//
//  Extensions.swift
//  Demo
//
//  Created by Victor Chen on 2019/10/18.
//  Copyright © 2019 Mt. Zendo All rights reserved.
//

import Foundation

extension NSObject {
    public class var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    public var className: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }
}

extension UserDefaults {
    public static var cachedPage: Int {
        set{
            UserDefaults.standard.set(newValue, forKey: _pageKey)
        }
        get{
            return UserDefaults.standard.integer(forKey: _pageKey)
        }
    }
}
