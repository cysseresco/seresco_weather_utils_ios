//
//  Wibd.swift
//  garrigues
//
//  Created by Diego Salcedo on 10/09/22.
//  Copyright © 2022 Seresco. All rights reserved.
//

import Foundation

struct Wind: Codable {
    let direction: String
    let period: String?
    let velocity: Int

    enum CodingKeys: String, CodingKey {
       case direction = "direccion"
       case period = "periodo"
       case velocity = "velocidad"
     }
}
