//
//  WxViewModel.swift
//  PageViewPlus
//
//  Created by Macbook on 5/8/18.
//  Copyright © 2018 Jaminya. All rights reserved.
//

import UIKit

class WxViewModel: UIViewController {
    
    let forecast: Forecast?
    
    init(forecast: Forecast) {
        self.forecast = forecast
        super.init(nibName: nil, bundle: nil)
    }
    
    // Required to conform with NSCoder protocol
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    func createViewController() -> UIViewController? {
        
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "wxViewController") as? WxViewController

        guard let city = forecast?.city,
            let state = forecast?.state,
            let temperature = forecast?.temperature,
            let humidity = forecast?.humidity
        else {
            return viewController   // viewcontroller will be set to default values.
        }
        
        viewController?.cityState = city + ", " + state
        viewController?.temperature = temperature
        viewController?.humidity = humidity
        viewController?.image = setWeatherImage(forecast: forecast!)
        
        return viewController
    }
    
    private func setWeatherImage(forecast: Forecast) -> UIImage {
        var image: UIImage
        
        switch forecast.sky {
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
} // WxViewModel
