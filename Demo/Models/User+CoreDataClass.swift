//
//  User+CoreDataClass.swift
//  Demo
//
//  Created by Victor Chen on 18/10/19.
//  Copyright © 2019 Mt. Zendo All rights reserved.
//
//

import Foundation
import CoreData

public class User: BaseManagedObject {
    
    @NSManaged public var gender: String?
    @NSManaged public var name: Name?
    @NSManaged public var location: Location?
    @NSManaged public var email: String?
    @NSManaged public var phone: String?
    @NSManaged public var cell: String?
    @NSManaged public var login: Login?
    @NSManaged public var dob: Dob?
    @NSManaged public var registered: Dob?
    @NSManaged public var picture: Picture?
    @NSManaged public var page: Int32

    @nonobjc public override class func fetchRequest() -> NSFetchRequest<NSFetchRequestResult> {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let sortDes0 = NSSortDescriptor(key: "page", ascending: true)
        let sortDes1 = NSSortDescriptor(key: "name.firstName", ascending: true)
        request.sortDescriptors = [sortDes0, sortDes1]
        request.fetchOffset = 0
        request.fetchLimit = _pageCount
        return request
    }
    
    public class func adds(userArr: [[String: Any]]) {
        for userData in userArr {
            add(userData: userData)
        }
        _appDelegate.saveContext()
    }
    
    override public func setData(_ data: [String : Any]) {
        gender = data["gender"] as? String
        email = data["email"] as? String
        phone = data["phone"] as? String
        cell = data["cell"] as? String
        page = Int32(UserDefaults.cachedPage)
    }
    
    private class func add(userData:[String: Any]) {
        let user = User.instance() as! User
        
        let name = Name.instance() as! Name
        name.setData(userData["name"] as! [String : Any])
        
        let location = Location.instance() as! Location
        location.setData(userData["location"] as! [String : Any])
        
        let login = Login.instance() as! Login
        login.setData(userData["login"] as! [String : Any])
        
        let dob = Dob.instance() as! Dob
        dob.setData(userData["dob"] as! [String : Any])
        
        let registered = Dob.instance() as! Dob
        registered.setData(userData["registered"] as! [String : Any])
        
        let picture = Picture.instance() as! Picture
        picture.setData(userData["picture"] as! [String : Any])
        
        user.name = name
        user.location = location
        user.login = login
        user.dob = dob
        user.registered = registered
        user.picture = picture
        user.setData(userData)
    }
}
