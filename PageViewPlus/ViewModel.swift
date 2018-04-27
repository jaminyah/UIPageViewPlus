//
//  ViewModel.swift
//  PageViewPlus
//
//  Created by macbook on 4/25/18.
//  Copyright © 2018 Jaminya. All rights reserved.
//

import Foundation
import UIKit

struct ViewModel {
    var cityRegion: String = "Gainsville, FL"
    var image: UIImage = #imageLiteral(resourceName: "Sun")
    var temperature: String = "80"
    var humidity: String = "50"
    
    fileprivate var forecast: Forecast
    
    init(forecast: Forecast) {
        self.forecast = forecast
        self.cityRegion = setCityRegion(forecast: self.forecast)
        self.image = setWeatherImage(forecast: self.forecast)
        self.temperature = setTemperature(forecast: self.forecast)
    }
    
    func setCityRegion(forecast: Forecast) -> String {
       let cityRegion = forecast.city! + ", " + forecast.state!
        return cityRegion
    }
    
    func setWeatherImage(forecast: Forecast) -> UIImage {
        var image: UIImage
        
        switch forecast.sky! {
        case "Sunny":
            image = #imageLiteral(resourceName: "Sun")
        case "Cloudy":
            image = #imageLiteral(resourceName: "Cloud")
        case "Rain":
            image = #imageLiteral(resourceName: "Rain")
        case "Partly Sunny":
            image = #imageLiteral(resourceName: "PartlySunny")
        case "Storm":
            image = #imageLiteral(resourceName: "Storm")
        default:
            image = #imageLiteral(resourceName: "Sun")
        }
        return image
    }

    func setTemperature(forecast: Forecast) -> String {
        let temperature = String(describing: forecast.temperature)
        return temperature
    }
    
    func setHumidity(forecast: Forecast) -> String {
        let humidity = String(describing: forecast.humidity)
        return humidity
    }
}
