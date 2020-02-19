//
//  EpisodeTableViewCell.swift
//  AppOfThrones
//
//  Created by Fran González on 17/02/2020.
//  Copyright © 2020 Fran González. All rights reserved.
//

import UIKit



class EpisodeTableViewCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var rateButton: UIButton!
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var star01: UIImageView!
    @IBOutlet weak var star02: UIImageView!
    @IBOutlet weak var star03: UIImageView!
    @IBOutlet weak var star04: UIImageView!
    @IBOutlet weak var star05: UIImageView!
    
    
    var rateBlock: (() -> Void)?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumb.layer.cornerRadius = 2.0
        thumb.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        thumb.layer.borderWidth = 1.0
        rateButton.layer.cornerRadius = 15
    }

    func setEpisode(_ episode:Episode){
        thumb.image = episode.image == nil ? nil : UIImage.init(named: episode.image!)
        title.text  = episode.name
        date.text   = episode.date
        
        if let ratingValue = DataController.shared.ratingForEpisode(episode) {
            switch ratingValue.rate {
            case .rated(let value):
                ratingLabel.text = String(value)
                self.setRating(value)
            case .unrated:
                self.modeRate()
            }
        } else {
            self.modeRate()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func fire(_ sender: Any) {
        self.rateBlock?()
    }
    
    private func setStarImage(_ imageView: UIImageView, rating: Double, minValue: Double) {
        if rating >= minValue + 1.0 && rating < minValue + 2.0 {
            imageView.image = UIImage.init(systemName: "star.lefthalf.fill")
        } else if rating >= minValue + 2.0 {
            imageView.image = UIImage.init(systemName: "star.fill")
        } else {
            imageView.image = UIImage.init(systemName: "star")
        }
    }
    
    // MARK: - Rating
    
    func modeRate() {
        rateButton.isHidden = false
        title.isHidden = true
        star01.isHidden = true
        star02.isHidden = true
        star03.isHidden = true
        star04.isHidden = true
        star05.isHidden = true
    }
    
    func setRating(_ rating: Double) {
        rateButton.isHidden = true
        ratingLabel.isHidden = false
        star01.isHidden = false
        star02.isHidden = false
        star03.isHidden = false
        star04.isHidden = false
        star05.isHidden = false
        
        self.setStarImage(star01, rating: rating, minValue: 0)
        self.setStarImage(star02, rating: rating, minValue: 2)
        self.setStarImage(star03, rating: rating, minValue: 4)
        self.setStarImage(star04, rating: rating, minValue: 6)
        self.setStarImage(star05, rating: rating, minValue: 8)
        

    }
    
    func didRateChanged(){
    }
}
