//
//  HouseSeatTableViewCell.swift
//  AppOfThrones
//
//  Created by Fran González on 23/02/2020.
//  Copyright © 2020 Fran González. All rights reserved.
//

import UIKit

class HouseSeatTableViewCell: UITableViewCell {

    @IBOutlet weak var houseSeat: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
