//
//  Street+CoreDataClass.swift
//  Demo
//
//  Created by Victor Chen on 2019/10/19.
//  Copyright © 2019 Mt. Zendo All rights reserved.
//
//

import Foundation
import CoreData

public class Street: BaseManagedObject {
    
    @NSManaged public var number: Int32
    @NSManaged public var name: String?
    
    override public func setData(_ data: [String : Any]) {
        number = data["number"] as? Int32 ?? 0
        name = data["name"] as? String
    }
    
    public func getStreet() -> String {
        return (String(number) + " " + (name ?? ""))
    }
}
