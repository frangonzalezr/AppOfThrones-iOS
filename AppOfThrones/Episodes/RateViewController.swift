//
//  RateViewController.swift
//  AppOfThrones
//
//  Created by Fran González on 11/022020.
//  Copyright © 2020 Fran González. All rights reserved.
//

import UIKit

protocol RateViewControllerDelegate {
    func didRateChanged()
}

class RateViewController: UIViewController {
    

    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var star01: UIImageView!
    @IBOutlet weak var star02: UIImageView!
    @IBOutlet weak var star03: UIImageView!
    @IBOutlet weak var star04: UIImageView!
    @IBOutlet weak var star05: UIImageView!
    
    private var episode: Episode?
    var delegate: RateViewControllerDelegate?
    
    convenience init(withEpisode episode: Episode) {
        self.init(nibName: "RateViewController", bundle: nil)
        self.episode = episode
        self.title = episode.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmButton.layer.cornerRadius = 8.0
        
    }
    
    // MARK: -IBActions
    
    @IBAction func fire(_ sender: UISlider) {

        let rate = Double(Int(sender.value * 5)/10)
        rateLabel.text = String(rate)
        
        self.setRating(rate)
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func accept(_ sender: Any) {
        rateLabel.text = "Accept"
        let rate = Double(Int(slider.value * 5)/10)
        if let episode = episode {
            DataController.shared.rateEpisode(episode, value: rate)
        }
        self.delegate?.didRateChanged()
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: -Rating
    
    func setRating(_ rating: Double)  {
        rateLabel.text = String(rating)
        self.setStarImage(star01, rating: rating, position: 0)
        self.setStarImage(star02, rating: rating, position: 1)
        self.setStarImage(star03, rating: rating, position: 2)
        self.setStarImage(star04, rating: rating, position: 3)
        self.setStarImage(star05, rating: rating, position: 4)
    }
    
    func setStarImage(_ imageView: UIImageView, rating: Double, position: Int){
        
        let positionDouble = Double(position * 2)
        if rating >= positionDouble + 1.0 && rating < positionDouble + 2.0 {
            imageView.image = UIImage.init(systemName: "star.lefthalf.fill")
        } else if rating >= positionDouble {
            imageView.image = UIImage.init(systemName: "star.fill")
        } else {
            imageView.image = UIImage.init(systemName: "star")
        }
        
    }
}
