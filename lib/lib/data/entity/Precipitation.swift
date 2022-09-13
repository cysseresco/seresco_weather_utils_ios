//
//  Precipitation.swift
//  garrigues
//
//  Created by Diego Salcedo on 10/09/22.
//  Copyright © 2022 Seresco. All rights reserved.
//

import Foundation

struct Precipitation: Codable {
    let value: Int
    let period: String?

    enum CodingKeys: String, CodingKey {
       case value = "value"
       case period = "periodo"
     }
}
