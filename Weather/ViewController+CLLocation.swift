//
//  ViewController+CLLocation.swift
//  Weather
//
//  Created by 澈水 on 2022/4/6.
//

import Foundation
import CoreLocation
import Alamofire
import SwiftyJSON

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lon = locations[0].coordinate.longitude
        let lat = locations[0].coordinate.latitude
        let location = "\(lon),\(lat)"
        
        
        AF.request(kQWeatherCityPath, parameters: getParameters(location)).responseJSON { response in
            if let data = response.value {
                let jsonData = JSON(data)
                self.showCity(jsonData)
            }
        }
        
        AF.request(kQWeatherNowPath, parameters: getParameters(location)).responseJSON { response in
            if let data = response.value {
                let jsonData = JSON(data)
                self.showWeather(jsonData)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
