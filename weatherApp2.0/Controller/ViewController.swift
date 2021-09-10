//
//  ViewController.swift
//  weatherApp2.0
//
//  Created by F1xTeoNtTsS on 07.09.2021.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    let configView = ConfigView()
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView.setView(view)
        configView.searchField.delegate = self
        weatherManager.delegate = self
        configView.searchButton.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        configView.locationButton.addTarget(self, action: #selector(locationButtonPressed), for: .touchUpInside)
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()

        
    }

}



// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    @objc func searchButtonPressed(){
        configView.searchField.endEditing(true)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let cityName = textField.text {
            weatherManager.fetchWeather(cityName: cityName)
        }
        textField.text = ""
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
// MARK: - WeatherManagerDelegate
extension ViewController: WeatherManagerDelegate{
    func didUpdateData(_ weatherManager: WeatherManager, weatherData: CurrentWeatherData) {
        DispatchQueue.main.async {
            self.configView.cityNameLabel.text = weatherData.cityName
            self.configView.currentTemperatureLabel.text = weatherData.temperatureString
            self.configView.currentWeatherImage.image = UIImage(systemName: weatherData.systemIconName)
        }
    }
}

// MARK: - CLLocationManagerDelegate
extension ViewController: CLLocationManagerDelegate {
    @objc func locationButtonPressed(){
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        locationManager.stopUpdatingLocation()
        let lat = location.coordinate.latitude
        let lon = location.coordinate.longitude
        weatherManager.fetchWeather(latitude: lat, longitude: lon)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

