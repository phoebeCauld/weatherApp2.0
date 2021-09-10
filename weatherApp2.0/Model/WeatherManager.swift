//
//  WeatherManager.swift
//  weatherApp2.0
//
//  Created by F1xTeoNtTsS on 07.09.2021.
//

import UIKit
import CoreLocation

protocol WeatherManagerDelegate: AnyObject {
    func didUpdateData(_ weatherManager: WeatherManager, weatherData: CurrentWeatherData)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(apiKey)&units=metric&"
    
    var delegate: WeatherManagerDelegate?
    
    
    func fetchWeather(cityName: String){
        guard let name = cityName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        let urlString = "\(weatherURL)q=\(name)"
        performRequest(with: urlString)
    }
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
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
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpdateData(self, weatherData: weather)
                    }
                    
                }
                
            })
            // Start a task
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> CurrentWeatherData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let currentWeather = CurrentWeatherData(currentWeatherData: decodedData)
            return currentWeather
        } catch let error as NSError {
            print(error.localizedDescription)
            return nil
        }
    }
    
    
}
