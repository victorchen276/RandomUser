//
//  Dob+CoreDataClass.swift
//  Demo
//
//  Created by Victor Chen on 2019/10/18.
//  Copyright © 2019 Mt. Zendo All rights reserved.
//
//

import Foundation
import CoreData

public class Dob: BaseManagedObject {

    @NSManaged public var date: String?
    @NSManaged public var age: Int32
    
    override public func setData(_ data: [String : Any]) {
        date = data["date"] as? String
        age = data["age"] as! Int32
    }
    
    public func getNormalDate() -> String? {
        guard date != nil else {
            return nil
        }
        return (date ?? "") + " " + String(age)
    }
}
