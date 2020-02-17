//
//  CastTableViewCell.swift
//  AppOfThrones
//
//  Created by Fran González on 17/02/2020.
//  Copyright © 2020 Fran González. All rights reserved.
//

import UIKit

protocol CastTableViewCellDelegate: class {
    
}

class CastTableViewCell: UITableViewCell {

    
    private weak var cast: Cast?
    weak var delegate: CastTableViewCellDelegate?
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var episodes: UILabel!
    @IBOutlet weak var heart: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatar.layer.cornerRadius = 8
        avatar.layer.borderWidth = 1.0
        avatar.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
    }

    
    func setCast(_ cast: Cast) {
        avatar.image = cast.avatar == nil ? nil : UIImage.init(named: cast.avatar!)
        name.text   = cast.fullname
        role.text   = cast.role
        episodes.text = "\(cast.episodes ?? 0) Episodes"

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
