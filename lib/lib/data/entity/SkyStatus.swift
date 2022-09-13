//
//  SkyStatus.swift
//  garrigues
//
//  Created by Diego Salcedo on 10/09/22.
//  Copyright © 2022 Seresco. All rights reserved.
//

import Foundation

struct SkyStatus: Codable {
    let value: String
    let period: String?
    let description: String

    enum CodingKeys: String, CodingKey {
       case value = "value"
       case period = "periodo"
       case description = "descripcion"
     }
}
