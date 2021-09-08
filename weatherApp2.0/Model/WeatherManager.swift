//
//  WeatherManager.swift
//  weatherApp2.0
//
//  Created by F1xTeoNtTsS on 07.09.2021.
//

import UIKit

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(apiKey)&units=metric&"
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
        // create url
        if let url = URL(string: urlString) {
            // create URLSession
            let urlSession = URLSession(configuration: .default)
            // give URLSession a task
            let task = urlSession.dataTask(with: url, completionHandler: {data, _, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                } else
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)
                    print(dataString)
                }
                
            })
            task.resume()
        }
    }
    
}
