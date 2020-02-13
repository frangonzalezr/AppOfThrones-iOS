//
//  RateViewController.swift
//  AppOfThrones
//
//  Created by Fran González on 11/022020.
//  Copyright © 2020 Fran González. All rights reserved.
//

import UIKit

class RateViewController: UIViewController {
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmButton.layer.cornerRadius = 8.0
        
    }
    
    @IBAction func fire(_ sender: Any) {
        let valueInt = Int(slider.value)
        self.rateLabel.text = "\(valueInt)"
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func accept(_ sender: Any) {
        rateLabel.text = "Accept"
        UIView.animate(withDuration: 0.25){
            self.imageView.frame.origin.y = 200
        }

    }
    
}
