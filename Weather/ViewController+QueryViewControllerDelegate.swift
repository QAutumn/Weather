//
//  ViewController+QueryViewControllerDelegate.swift
//  Weather
//
//  Created by 澈水 on 2022/4/7.
//

import UIKit
import Alamofire
import SwiftyJSON

extension ViewController: QueryViewControllerDelegate {
    
    func didChangeCity(city: String) {
        
        AF.request(kQWeatherCityPath, parameters: getParameters(city)).responseJSON { response in
            if let data = response.value {
                let jsonData = JSON(data)
                print(jsonData)
            }
        }
       
    }
}
