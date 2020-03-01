//
//  MainAttributesTableViewCell.swift
//  AppOfThrones
//
//  Created by Fran González on 26/02/2020.
//  Copyright © 2020 Fran González. All rights reserved.
//

import UIKit

class MainAttributesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var mainAttribute: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
