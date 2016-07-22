//
//  WeatherViewControllerTests.swift
//  Weather
//
//  Created by Ayaka Nonaka on 7/5/16.
//  Copyright © 2016 Ayaka Nonaka. All rights reserved.
//

import XCTest
@testable import Weather

class WeatherViewControllerTests: XCTestCase {

    func testInitialization() {
        let json = loadJSONFixture(for: "observation")
        let observation = Observation(dictionary: json)!

        let viewController = WeatherViewController(with: observation)

        XCTAssertEqual(observation, viewController.observation)

        // Test viewController.weatherLabel?
        // Test viewController.temperatureLabel?
        // Test viewController.cityLabel?

        // Problems:

        // 1. weatherLabel, temperatureLabel, cityLabel are private (by design!)

        // 2. We *could* do UI testing instead, but unit tests are way faster.

        // 3. WeatherViewController is coupled to Observation,
        // which is very specific to Weather Underground’s API.

        // We can do better!
    }
}
