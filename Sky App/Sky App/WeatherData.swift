//
//  WeatherData.swift
//  Sky App
//
//  Created by Shaima Alharbi on 04/02/1445 AH.
//

import Foundation

struct WeatherData: Codable {
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let humidity: Int
}

struct Weather: Codable {
    let description: String
}
