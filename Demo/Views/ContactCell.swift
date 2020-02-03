//
//  ContactCell.swift
//  Demo
//
//  Created by Victor Chen on 2019/10/20.
//  Copyright © 2019 Mt. Zendo All rights reserved.
//

import UIKit

class ContactCell: BaseCell {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var cellLabel: UILabel!
    
    override func setupData(_ user: User?) {
        guard user != nil else {
            return
        }
        emailLabel.text = user?.email
        phoneLabel.text = user?.phone
        cellLabel.text = user?.cell
    }
    
    override func prepareForReuse() {
        emailLabel.text = nil
        phoneLabel.text = nil
        cellLabel.text = nil
    }
}
