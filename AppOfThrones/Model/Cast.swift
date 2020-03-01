//
//  Cast.swift
//  AppOfThrones
//
//  Created by Fran González on 13/02/2020.
//  Copyright © 2020 Fran González. All rights reserved.
//

import Foundation

class Cast: Identifiable, Codable, Equatable, CustomStringConvertible {
    var id: Int
    var avatar: String?
    var fullname: String?
    var role: String?
    var episodes: Int?
    var birth: String?
    var placeBirth: String?
    var description: String {
        return "\(id), \(avatar ?? ""), \(fullname ?? ""), \(role ?? ""), \(episodes ?? 0), \(birth ?? ""), \(placeBirth ?? "")"
    }
    
    static func == (lhs: Cast, rhs: Cast) -> Bool {
        return
            lhs.id == rhs.id &&
            lhs.avatar == rhs.avatar &&
            lhs.fullname == rhs.fullname &&
            lhs.role == rhs.role &&
            lhs.episodes == rhs.episodes &&
            lhs.birth == rhs.birth &&
            lhs.placeBirth == rhs.placeBirth
    }
}
