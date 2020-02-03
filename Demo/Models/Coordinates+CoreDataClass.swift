//
//  Coordinates+CoreDataClass.swift
//  Demo
//
//  Created by Victor Chen on 2019/10/19.
//  Copyright © 2019 Mt. Zendo All rights reserved.
//
//

import Foundation
import CoreData

public class Coordinates: BaseManagedObject {
    
    @NSManaged public var latitude: String?
    @NSManaged public var longitude: String?
    
    override public func setData(_ data: [String : Any]) {
        latitude = data["latitude"] as? String
        longitude = data["longitude"] as? String
    }
}
