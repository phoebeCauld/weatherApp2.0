//
//  CurrentWeatherData.swift
//  weatherApp2.0
//
//  Created by F1xTeoNtTsS on 09.09.2021.
//

import Foundation

struct CurrentWeatherData {
    init(currentWeatherData: WeatherData) {
        conditionCode = currentWeatherData.weather[0].id
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
    }
    
    let cityName: String
    let conditionCode: Int
    var systemIconName: String {
        switch conditionCode {
        case 200...232: return "cloud.bolt.rain"
        case 300...321: return "cloud.drizzle"
        case 500...531: return "cloud.rain"
        case 600...622: return "snow"
        case 701...781: return "cloud.fog"
        case 800: return "sun.max"
        case 801...804: return "cloud.sun"
        default: return "nosign"
        }
    }
    
    let temperature: Double
    var temperatureString: String {
        return String(format: "%.0F", temperature)
    }
}
