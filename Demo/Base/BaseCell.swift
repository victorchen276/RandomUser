//
//  BaseCell.swift
//  Demo
//
//  Created by Victor Chen on 2019/10/20.
//  Copyright © 2019 Mt. Zendo All rights reserved.
//

import UIKit

enum DetailCellType: Int {
    case basicInfo = 0
    case contact
    case login
    case location
    case totalCount
    static var reusedIDs = ["BasicInfoCell", "ContactCell", "LoginInforCell", "LocationCell"]
}

class BaseCell: UITableViewCell {
    static var reusedID: String {
        return self.className
    }
    
    func setupData(_ user: User?) {
        assert(false, "should be override by subclass")
    }
    
    override func prepareForReuse() {
        assert(false, "should be override by subclass")
    }
}
