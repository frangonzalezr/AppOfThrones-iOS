//
//  DataController.swift
//  AppOfThrones
//
//  Created by Fran González on 17/02/2020.
//  Copyright © 2020 Fran González. All rights reserved.
//

import Foundation

protocol Identifiable {
    var id: Int { get }
}

class DataController {
    
    
    static var shared = DataController()
    private init() {
    }
    
    //var id: Int = 0
    
    var animationPlayed: Bool = false
    
    private var rating: [Rating] = []
    private var favorite: [Int] = []
    
    // MARK: - Favorite
    
    func cleanFavorite() {
        favorite.removeAll()
    }
    
    func isFavorite<T: Identifiable>(_ value:T) -> Bool {
        return favorite.contains(value.id)
    }
    
    func addFavorite<T:Identifiable>(_ value:T) {
        if self.isFavorite(value) == false {
            favorite.append(value.id)
        }
    }
    
    func removeFavorite<T:Identifiable>(_ value:T) {
        if let index = favorite.firstIndex(of: value.id){
            favorite.remove(at: index)
        }
    }
    
    /*
    
    func isFavoriteCast(_ cast:Cast) -> Bool {
        return favorite.contains(cast.id)
    }

    func addFavoriteCast(_ cast:Cast) {
        if self.isFavoriteCast(cast) == false {
            favorite.append(cast.id)
        }
    }
    func removeFavoriteCast(_ cast:Cast) {
        if let index = favorite.firstIndex(of: cast.id){
            favorite.remove(at: index)
        }
    }
    */
    
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
