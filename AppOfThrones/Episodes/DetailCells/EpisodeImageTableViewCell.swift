//
//  EpisodeImageTableViewCell.swift
//  AppOfThrones
//
//  Created by Fran González on 24/02/2020.
//  Copyright © 2020 Fran González. All rights reserved.
//

import UIKit

class EpisodeImageTableViewCell: UITableViewCell {

    @IBOutlet weak var episodeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
