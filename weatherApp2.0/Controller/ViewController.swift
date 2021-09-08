//
//  ViewController.swift
//  weatherApp2.0
//
//  Created by F1xTeoNtTsS on 07.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let configView = ConfigView()
    let weatherManager = WeatherManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        configView.setView(view)
        configView.searchField.delegate = self
        configView.searchButton.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
    }
    @objc func searchButtonPressed(){
        configView.searchField.endEditing(true)
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = textField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        textField.text = ""
    }
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//
//    }
//
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
