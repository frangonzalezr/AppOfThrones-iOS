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
    
    var id: Int = 0
}
