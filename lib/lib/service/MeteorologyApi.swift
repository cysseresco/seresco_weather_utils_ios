//
//  MeteorologyApi.swift
//  garrigues
//
//  Created by Diego Salcedo on 5/09/22.
//  Copyright © 2022 Seresco. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class MeteorologyApi {
    
    struct endpoints {
        static let meteorologyPrediction = "api/prediccion/especifica/municipio/diaria/%@"
        static let weatherPrediction = "sh/%@"
    }
    
    static func getWeatherPredictionsKey(municipalityId: String, completion: @escaping (MunicipalityPrediction) -> ()) {
        
        let headers: HTTPHeaders = [
            "api_key": Constants.AEMET_API_KEY,
            "Content-Type": "application/json"
        ]
        let url = String(format: "\(Constants.BASE_URL)\(endpoints.meteorologyPrediction)", municipalityId)
        
        let request = NetworkManager.unauthorizedSharedManager.request(url,
                                                                       method: .get,
                                                                       parameters: nil,
                                                                       encoding: URLEncoding.default,
                                                                       headers: headers)
        
        request.responseJSON { response in
            switch response.result {
            case .success(let predictionData):
                if let data: [String:Any] = predictionData as? [String : Any] {
                    let jsonData = try? JSONSerialization.data(withJSONObject:data)
                    let decoder = JSONDecoder()
                    do {
                        let predicitonData = try decoder.decode(PredictionData.self, from: jsonData!)
                        let predicitonKeyArr = predicitonData.data.components(separatedBy: "/sh/")
                        getWeatherPredictions(key: predicitonKeyArr[1]) { weatherPrediction in
                            completion(weatherPrediction)
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            case .failure(let error):
                print("Error in getWeatherPredictionsKey: \(error.localizedDescription)")
            }
        }
        
    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    class func getWeatherPredictions(key: String, completion: @escaping (MunicipalityPrediction) -> ()) {
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json;charset=ISO-8859-15"
        ]
        let url = String(format: "\(Constants.BASE_URL)\(endpoints.weatherPrediction)", key)
        
        let request = NetworkManager.unauthorizedSharedManager.request(url,
                                                                       method: .get,
                                                                       parameters: nil,
                                                                       encoding: URLEncoding.default,
                                                                       headers: headers)
        
        request.responseString { response in
            switch response.result {
            case .success(let weatherPrediction):
                let jsonData = weatherPrediction.data(using: .utf8)!
                do {
                    let decoder = JSONDecoder()
                    let municipalityPredictions = try decoder.decode([MunicipalityPrediction].self, from: jsonData)
                    DispatchQueue.main.async {
                        if let weatherPrediction = municipalityPredictions.first {
                            completion(weatherPrediction)
                        }
                    }
                } catch {
                    print (error)
                }
                
            case .failure(let error):
                print("hey! error \(error.localizedDescription)")
            }
        }
        
        
    }
    
}
