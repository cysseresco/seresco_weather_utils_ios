//
//  TemperatureItem.swift
//  garrigues
//
//  Created by Diego Salcedo on 10/09/22.
//  Copyright © 2022 Seresco. All rights reserved.
//

import Foundation

struct TemperatureItem: Codable {
    let value: Int
    let time: Int
    var skyStatus: String?
    
    enum CodingKeys: String, CodingKey {
        case value = "value"
        case time = "hora"
        case skyStatus = "skyStatus"
    }
}
