//
//  Forecast.swift
//  PageViewPlus
//
//  Created by macbook on 4/25/18.
//  Copyright © 2018 Jaminya. All rights reserved.
//

import UIKit

struct Forecast {
    let sky: String?
    let temperature: Int?
    let humidity: Int?
    let city: String?
    let state: String?
    
    init(sky: String?, temperature: Int?, humidity: Int?, city: String?, state: String?) {
        self.sky = sky
        self.temperature = temperature
        self.humidity = humidity
        self.city = city
        self.state = state
    }
}
