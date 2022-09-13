//
//  Day.swift
//  garrigues
//
//  Created by Diego Salcedo on 10/09/22.
//  Copyright © 2022 Seresco. All rights reserved.
//

import Foundation

struct Day: Codable {
    let skyStatus: [SkyStatus]
    let probabilityPrecipitation: [Precipitation]
    let temperature: Temperature
    let wind: [Wind]
    let relativeHumidity: RelativeHumidity
    
    enum CodingKeys: String, CodingKey {
        case skyStatus = "estadoCielo"
        case probabilityPrecipitation = "probPrecipitacion"
        case temperature = "temperatura"
        case wind = "viento"
        case relativeHumidity = "humedadRelativa"
    }
}

extension Day {
    func getWeatherItems() -> [TemperatureItem] {
        var items: [TemperatureItem] = self.temperature.data
        
        let skyStatus = self.skyStatus.filter { $0.period == "00-06" || $0.period == "06-12" || $0.period == "12-18" || $0.period == "18-24" }
        skyStatus.forEach { skyStatus in
            switch skyStatus.period {
            case "00-06":
                items[0].skyStatus = skyStatus.description
            case "06-12":
                items[1].skyStatus = skyStatus.description
            case "12-18":
                items[2].skyStatus = skyStatus.description
            case "18-24":
                items[3].skyStatus = skyStatus.description
            default:
                items[0].skyStatus = skyStatus.description
            }
        }
        
        return items
    }
}
