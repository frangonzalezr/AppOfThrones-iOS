//
//  EpisodeViewController.swift
//  AppOfThrones
//
//  Created by Fran González on 13/02/2020.
//  Copyright © 2020 Fran González. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {
    
    var episodes: [Episode] = [Episode.init(id: 1, name: "Winter is coming", date: "13/2/2020", image: "", episode: 1, season: 1, overview: "Winter is coming")]
    
    
    @IBAction func openRate(_ sender: Any) {
    }
    
}

