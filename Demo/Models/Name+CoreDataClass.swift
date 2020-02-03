//
//  Name+CoreDataClass.swift
//  Demo
//
//  Created by Victor Chen on 18/10/19.
//  Copyright © 2019 Mt. Zendo All rights reserved.
//
//

import Foundation
import CoreData

public class Name: BaseManagedObject {
    
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var title: String?

    override public func setData(_ data: [String : Any]) {
        firstName = data["first"] as? String
        lastName = data["last"] as? String
        title = data["title"] as? String
    }
    
    public func getFullName() -> String {
        return (lastName ?? "") + " " + (firstName ?? "")
    }
}
