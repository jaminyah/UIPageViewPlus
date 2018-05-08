//
//  Forecast.swift
//  PageViewPlus
//
//  Created by macbook on 4/25/18.
//  Copyright © 2018 Jaminya. All rights reserved.
// 
// Note: Since all property values are initialized with the init method
//       using optional types is not correct.

import UIKit

struct Forecast {
    let sky: String
    let temperature: String
    let humidity: String
    let city: String
    let state: String
    
    init(sky: String, temperature: String, humidity: String, city: String, state: String) {
        self.sky = sky
        self.temperature = temperature
        self.humidity = humidity
        self.city = city
        self.state = state
    }
}
