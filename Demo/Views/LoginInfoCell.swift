//
//  LoginInfoCell.swift
//  Demo
//
//  Created by Victor Chen on 2019/10/21.
//  Copyright © 2019 Mt. Zendo All rights reserved.
//

import UIKit

class LoginInfoCell: BaseCell {

    @IBOutlet weak var uuidLabel: UILabel!
    @IBOutlet weak var uNameLabel: UILabel!
    @IBOutlet weak var pwdLabel: UILabel!
    @IBOutlet weak var registeredLabel: UILabel!
    
    override func setupData(_ user: User?) {
        guard user != nil else {
            return
        }
        uuidLabel.text = user?.login?.uuid
        uNameLabel.text = user?.login?.username
        pwdLabel.text = user?.login?.getShowPassword()
        registeredLabel.text = user?.registered?.getNormalDate()
    }
    
    override func prepareForReuse() {
        uuidLabel.text = nil
        uNameLabel.text = nil
        pwdLabel.text = nil
        registeredLabel.text = nil
    }

}
