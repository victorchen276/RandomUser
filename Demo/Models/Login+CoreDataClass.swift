//
//  Login+CoreDataClass.swift
//  Demo
//
//  Created by Victor Chen on 2019/10/18.
//  Copyright © 2019 Mt. Zendo All rights reserved.
//
//

import Foundation
import CoreData

public class Login: BaseManagedObject {

    @NSManaged public var uuid: String?
    @NSManaged public var username: String?
    @NSManaged public var password: String?

    override public func setData(_ data: [String : Any]) {
        uuid = data["uuid"] as? String
        username = data["username"] as? String
        password = data["password"] as? String
    }
    
    public func getShowPassword() -> String? {
        guard let pwd = password, pwd.count > 3 else {
            return "***"
        }
        let index = pwd.index(pwd.startIndex, offsetBy: pwd.count - 3)
        let showPwd = pwd.replacingCharacters(in: index..., with: "***")
        print("pwd:\(pwd)--show-pwd:\(showPwd)")
        return showPwd
    }
}
