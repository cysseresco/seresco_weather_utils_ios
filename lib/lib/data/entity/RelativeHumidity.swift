//
//  RelativeHumidity.swift
//  garrigues
//
//  Created by Diego Salcedo on 10/09/22.
//  Copyright © 2022 Seresco. All rights reserved.
//

import Foundation

struct RelativeHumidity: Codable {
    let max: Int
    let min: Int
    let data: [TemperatureItem]
    
    enum CodingKeys: String, CodingKey {
        case max = "maxima"
        case min = "minima"
        case data = "dato"
    }
}

