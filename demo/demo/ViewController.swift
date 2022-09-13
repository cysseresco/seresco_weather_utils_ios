//
//  ViewController.swift
//  demo
//
//  Created by Diego Salcedo on 12/09/22.
//

import UIKit
import GoogleMaps
import GoogleMapsUtils

class ViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate  {

    var mapView: GMSMapView!
    let meteorologyUtils = MeteorologyUtils()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMaps()
        initUtils()
    }

    func initUtils() {
        meteorologyUtils.currentViewController = self
        
        let formatter = DateFormatter()
        //2016-12-08 03:37:22 +0000
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        let now = Date()
        let dateString = formatter.string(from:now)
        print("hey!! \(dateString)")
    }
    
    func initMaps() {
        let camera = GMSCameraPosition.camera(withLatitude: 43.361231, longitude: -5.848566, zoom: 12.0)
        mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        mapView.delegate = self
        view.addSubview(mapView)
    }

    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        
        let weatherTodaySheet = MeteorologyOptionsSheetViewController()
        weatherTodaySheet.delegate = self
        weatherTodaySheet.coordinates = coordinate
        self.present(weatherTodaySheet, animated: true, completion: nil)
        
        self.view.endEditing(true)
    }
    
}

extension ViewController: MeteorologyOptionsDelegate {
    func selectMeteorologyOption(meteorologyType: MeteorologyType, coordinate: CLLocationCoordinate2D) {
        meteorologyUtils.openMeteorologyPanel(meteorologyType: meteorologyType, coordinate: coordinate)
    }
}
