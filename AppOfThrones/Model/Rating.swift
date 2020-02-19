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

struct Rating {
    var id: Int
    var rate: Rate
}
