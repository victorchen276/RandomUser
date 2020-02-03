//
//  BaseManagedObject.swift
//  Demo
//
//  Created by Victor Chen on 2019/10/18.
//  Copyright © 2019 Mt. Zendo All rights reserved.
//

import Foundation
import CoreData

public class BaseManagedObject: NSManagedObject {
    public static func instance() -> BaseManagedObject {
        let entityDes = NSEntityDescription.entity(forEntityName: self.className, in: _cdContext)
        return BaseManagedObject(entity: entityDes!, insertInto: _cdContext)
    }
    
    func setData(_ data:[String: Any]) {
        assert(false, "should be override by subclass")
    }
}
