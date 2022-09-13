//
//  Prediction.swift
//  garrigues
//
//  Created by Diego Salcedo on 10/09/22.
//  Copyright © 2022 Seresco. All rights reserved.
//

import Foundation

struct Prediction: Codable {
    let days: [Day]

    enum CodingKeys: String, CodingKey {
       case days = "dia"
     }
}

