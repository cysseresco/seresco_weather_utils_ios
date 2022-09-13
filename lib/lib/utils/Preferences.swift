//
//  Preferences.swift
//  garrigues
//
//  Created by Diego Salcedo on 19/08/22.
//  Copyright © 2022 Seresco. All rights reserved.
//

import Foundation

struct Preferences {
    
    static var shared: Preferences = {
        let instance = Preferences()
        return instance
    }()
    
}
