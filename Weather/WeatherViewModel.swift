//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Ayaka Nonaka on 7/5/16.
//  Copyright © 2016 Ayaka Nonaka. All rights reserved.
//

import Foundation

struct WeatherViewModel: Equatable {

    let observation: Observation

    let city: String
    let weather: String
    let temperature: String

    init(with observation: Observation) {
        self.observation = observation

        city = observation.displayLocation.fullCityName
        weather = observation.weather
        temperature = String(format: "%.0f°", observation.temperatureFahrenheit)
    }
}

func ==(lhs: WeatherViewModel, rhs: WeatherViewModel) -> Bool {
    return lhs.city == rhs.city &&
    lhs.weather == rhs.weather &&
    lhs.temperature == rhs.temperature
}
