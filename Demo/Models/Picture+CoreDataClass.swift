//
//  Picture+CoreDataClass.swift
//  Demo
//
//  Created by Victor Chen on 2019/10/18.
//  Copyright © 2019 Mt. Zendo All rights reserved.
//
//

import Foundation
import CoreData

public class Picture: BaseManagedObject {
    
    @NSManaged public var large: String?
    @NSManaged public var medium: String?
    @NSManaged public var thumbnail: String?
    
    override public func setData(_ data: [String : Any]) {
        large = data["large"] as? String
        medium = data["medium"] as? String
        thumbnail = data["thumbnail"] as? String
    }
}
