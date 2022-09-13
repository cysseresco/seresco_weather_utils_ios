//
//  MunicipalityPrediction.swift
//  garrigues
//
//  Created by Diego Salcedo on 10/09/22.
//  Copyright © 2022 Seresco. All rights reserved.
//

import Foundation

struct MunicipalityPrediction: Codable {
    let name: String
    let province: String
    let prediction: Prediction

    enum CodingKeys: String, CodingKey {
        case name = "nombre"
        case province = "provincia"
        case prediction = "prediccion"
    }
}
