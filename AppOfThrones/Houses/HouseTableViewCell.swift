//
//  HouseTableViewCell.swift
//  AppOfThrones
//
//  Created by Fran González on 13/02/2020.
//  Copyright © 2020 Fran González. All rights reserved.
//

import UIKit

class HouseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var words: UILabel!
    @IBOutlet weak var seat: UILabel!
    
    override func awakeFromNib() {
        avatar.layer.cornerRadius = 8
        avatar.layer.borderColor  = UIColor.white.withAlphaComponent(0.2).cgColor
        avatar.layer.borderWidth  = 1.0
    }
    
    func setHouse(_ house: House) {
        avatar.image = house.imageName == nil ? nil : UIImage.init(named: house.imageName!)
        name.text  = house.name
        words.text = house.words
        seat.text = house.seat
    }
}
