//
//  Timezone+CoreDataClass.swift
//  Demo
//
//  Created by Victor Chen on 2019/10/19.
//  Copyright © 2019 Mt. Zendo All rights reserved.
//
//

import Foundation
import CoreData

public class Timezone: BaseManagedObject {
    
    @NSManaged public var offset: String?
    @NSManaged public var descriptions: String?
    
    override public func setData(_ data: [String : Any]) {
        offset = data["offset"] as? String
        descriptions = data["description"] as? String
    }
    
    public func getTimeZone() -> String {
        return ((offset ?? "") + " " + (descriptions ?? ""))
    }
}
