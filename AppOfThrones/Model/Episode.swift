//
//  Episode.swift
//  AppOfThrones
//
//  Created by Fran González on 13/02/2020.
//  Copyright © 2020 Fran González. All rights reserved.
//

import Foundation

class Episode:Identifiable, Codable, Equatable, CustomStringConvertible {
    var description: String {
        return "\(id), \(name ?? ""), \(date ?? ""), \(image ?? ""), \(episode), \(season), \(overview)"
    }
    
        
    var id: Int
    var name: String?
    var date: String?
    var image: String?
    var episode: Int
    var season: Int
    var overview: String
    
    
    static func == (lhs: Episode, rhs: Episode) -> Bool {
            return
                lhs.id == rhs.id &&
                lhs.name == rhs.name &&
                lhs.date == rhs.date &&
                lhs.image == rhs.image &&
                lhs.episode == rhs.episode &&
                lhs.season == rhs.season &&
                lhs.overview == rhs.overview
        }
    }
    

    


