//
//  DataController.swift
//  AppOfThrones
//
//  Created by Fran González on 17/02/2020.
//  Copyright © 2020 Fran González. All rights reserved.
//

import Foundation

class DataController {
    
    static var shared = DataController()
    private init() {
    }
    
    //var id: Int = 0
    
    private var rating: [Rating] = []
    
    // MARK: - Rating
    
    func rateEpisode(_ episode: Episode, value: Double) {
        if self.ratingForEpisode(episode) == nil {
            let value = Rating.init(id: episode.id, rate: .rated(value: value))
            rating.append(value)
        }
    }
    
    func removeRateEpisode(_ episode: Episode) {
        if let index = self.rating.firstIndex(where: { (rating) -> Bool in
                return episode.id == rating.id
        }) {
            self.rating.remove(at: index)
        }
    }
    
    func ratingForEpisode(_ episode: Episode) -> Rating? {
        let filtered = rating.filter { (rating) -> Bool in
            return rating.id == episode.id
        }
        return filtered.first
        }
}
