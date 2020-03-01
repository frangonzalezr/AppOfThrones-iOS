//
//  Rating.swift
//  AppOfThrones
//
//  Created by Fran González on 18/02/2020.
//  Copyright © 2020 Fran González. All rights reserved.
//

import Foundation

enum Rate {
    case unrated
    case rated(value: Double)
}

struct Rating: Equatable, CustomStringConvertible {
    var description: String {
        return "\(id), \(rate)"
    }
    
    static func == (lhs: Rating, rhs: Rating) -> Bool {
        return
            lhs.id == rhs.id
    }
    
    var id: Int
    var rate: Rate
}
