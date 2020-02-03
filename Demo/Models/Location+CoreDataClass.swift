//
//  Location+CoreDataClass.swift
//  Demo
//
//  Created by Victor Chen on 2019/10/18.
//  Copyright © 2019 Mt. Zendo All rights reserved.
//
//

import Foundation
import CoreData

public class Location: BaseManagedObject {
    
    @NSManaged public var city: String?
    @NSManaged public var state: String?
    @NSManaged public var country: String?
    @NSManaged public var postcode: Int32
    @NSManaged public var coordinates: Coordinates
    @NSManaged public var street: Street
    @NSManaged public var timeZone: Timezone
    
    override public func setData(_ data: [String: Any]) {
        let coor = Coordinates.instance() as! Coordinates
        coor.setData(data["coordinates"] as! [String : Any])
        
        let aStreet = Street.instance() as! Street
        aStreet.setData(data["street"] as! [String : Any])
        
        let aTimzone = Timezone.instance() as! Timezone
        aTimzone.setData(data["timezone"] as! [String : Any])
        
        city = data["city"] as? String
        state = data["state"] as? String
        country = data["country"] as? String
        postcode = (data["postcode"] as? Int32) ?? 0
        coordinates = coor
        street = aStreet
        timeZone = aTimzone
    }
}
