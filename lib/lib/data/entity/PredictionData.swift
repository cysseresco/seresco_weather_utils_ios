//
//  PredictionData.swift
//  garrigues
//
//  Created by Diego Salcedo on 5/09/22.
//  Copyright © 2022 Seresco. All rights reserved.
//

import Foundation

struct PredictionData: Codable {
    let description: String
    let status: Int
    let data: String
    let metadata: String

    enum CodingKeys: String, CodingKey {
       case description = "descripcion"
       case status = "estado"
       case data = "datos"
       case metadata = "metadatos"
     }
}
