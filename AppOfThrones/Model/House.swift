//
//  House.swift
//  AppOfThrones
//
//  Created by Fran González on 14/02/2020.
//  Copyright © 2020 Fran González. All rights reserved.
//

import Foundation

class House: Codable, Equatable, CustomStringConvertible {

    var imageName: String?
    var name: String?
    var words: String?
    var seat: String?
    var description: String {
        return "\(imageName ?? ""), \(name ?? ""), \(words ?? ""), \(seat ?? "")"
    }
    
    static func == (lhs: House, rhs: House) -> Bool {
        return
            lhs.imageName == rhs.imageName &&
            lhs.name == rhs.name &&
            lhs.words == rhs.words &&
            lhs.seat == rhs.seat
    }
}
