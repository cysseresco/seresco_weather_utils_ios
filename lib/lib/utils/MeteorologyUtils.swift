//
//  MeteorologyUtils.swift
//  garrigues
//
//  Created by Diego Salcedo on 10/09/22.
//  Copyright © 2022 Seresco. All rights reserved.
//

import UIKit
import GoogleMaps

public class MeteorologyUtils {
    
    var currentViewController: UIViewController?
    
    public func openMeteorologyPanel(meteorologyType: MeteorologyType, coordinate: CLLocationCoordinate2D) {
        let geocoder = GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(coordinate) { [self] (response, error) in
            if error != nil {
                return
            }
            
            guard let result = response?.firstResult() else {
                return
            }
            let postalCode = result.postalCode ?? ""
            
            guard let municipalityId = getMunicipalityIdFromPostalCode(postalCode: postalCode) else {
                return
            }
            openPanel(meteorologyType: meteorologyType, municipalityId: municipalityId)
        }
    }
    
    func openPanel(meteorologyType: MeteorologyType, municipalityId: String) {
        switch meteorologyType {
        case .WEATHER_TODAY:
            let weatherTodaySheet = WeatherTodaySheetViewController()
            weatherTodaySheet.municipalityId = municipalityId
            currentViewController?.present(weatherTodaySheet, animated: true, completion: nil)
        case .WEATHER_TOMORROW:
            let weatherTomorrowSheet = WeatherTomorrowSheetViewController()
            weatherTomorrowSheet.municipalityId = municipalityId
            currentViewController?.present(weatherTomorrowSheet, animated: true, completion: nil)
        case .WEATHER_WEEKLY:
            let weatherWeeklySheet = WeatherWeeklySheetViewController()
            weatherWeeklySheet.municipalityId = municipalityId
            currentViewController?.present(weatherWeeklySheet, animated: true, completion: nil)
        case .PRECIPITATION:
            let precipitationSheet = PrecipitationSheetViewController()
            precipitationSheet.municipalityId = municipalityId
            currentViewController?.present(precipitationSheet, animated: true, completion: nil)
        case .WIND:
            let windSheet = WindSheetViewController()
            windSheet.municipalityId = municipalityId
            currentViewController?.present(windSheet, animated: true, completion: nil)
        case .HUMIDITY:
            let humiditySheet = HumiditySheetViewController()
            humiditySheet.municipalityId = municipalityId
            currentViewController?.present(humiditySheet, animated: true, completion: nil)
        }
    }
    
    func getMunicipalityIdFromPostalCode(postalCode: String) -> String? {
        let csvPath = Bundle.main.path(forResource: "postal_code_municipes", ofType: "csv")

        if csvPath == nil {
            return nil
        }

        var csvData: String? = nil

        do {
            csvData = try String(contentsOfFile: csvPath!, encoding: String.Encoding.utf8)
            let csv = csvData?.csvRows()
            for row in csv!{
                if row.first == postalCode {
                    return row[1]
                }
            }
        } catch{
            print(error)
        }
        return nil
    }
}

public enum MeteorologyType {
    case WEATHER_TODAY
    case WEATHER_TOMORROW
    case WEATHER_WEEKLY
    case PRECIPITATION
    case WIND
    case HUMIDITY
}
