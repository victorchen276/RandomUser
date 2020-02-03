//
//  ListCell.swift
//  Demo
//
//  Created by Victor Chen on 2019/10/20.
//  Copyright © 2019 Mt. Zendo All rights reserved.
//

import UIKit
import AlamofireImage

class BasicInfoCell: BaseCell {
    
    enum ImgSize: Int8 {
        case small = 0
        case big
    }

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    
    override func setupData(_ user: User?) {
        guard user != nil else {
            return
        }
        let url: URL!
        
        
        
        if imgView.tag == ImgSize.small.rawValue {
            url = URL(string: user!.picture!.thumbnail!)
        } else if imgView.tag == ImgSize.big.rawValue {
            url = URL(string: user!.picture!.large!)
        } else {
            url = URL(string: "")
        }
        imgView.af_setImage(withURL: url, placeholderImage: UIImage(named: "placeHolder"))
        nameLabel.text = user!.name?.getFullName()
        genderLabel.text = user!.gender
        dobLabel.text = user!.dob?.getNormalDate()
    }
    
    override func prepareForReuse() {
        imgView.image = nil
        nameLabel.text = nil
        genderLabel.text = nil
        dobLabel.text = nil
    }
}
