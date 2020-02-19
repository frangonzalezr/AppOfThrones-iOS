//
//  House.swift
//  AppOfThrones
//
//  Created by Fran González on 14/02/2020.
//  Copyright © 2020 Fran González. All rights reserved.
//

import Foundation

class House {
    
    var imageName: String?
    var name: String?
    var words: String?
    var seat: String?
    
    init(imageName: String?, name: String?, words: String?, seat: String?) {
        self.imageName = imageName
        self.name  = name
        self.words = words
        self.seat  = seat
    }
}
