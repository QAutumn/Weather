//
//  ViewController+Helper.swift
//  Weather
//
//  Created by 澈水 on 2022/4/6.
//

import UIKit
import Alamofire
import SwiftyJSON

extension ViewController {
    
    func showCity(_ jsonData: JSON) {
        //数据
        weather.city = jsonData["location"][0]["name"].stringValue
        //UI
        cityLabel.text = weather.city
    }
    
    func showWeather(_ jsonData: JSON){
        //数据
        self.weather.temp = jsonData["now"]["temp"].stringValue
        self.weather.icon = jsonData["now"]["icon"].stringValue
        //UI
        self.tempLabel.text = self.weather.temp + "˚C"
        self.iconImageView.image = UIImage(named: self.weather.icon)
    }
    
    func getParameters(_ locatoin: String) -> [String: String] {
        ["location": locatoin, "key": kQWeatherKey]
    }
}
