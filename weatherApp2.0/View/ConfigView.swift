//
//  ConfigView.swift
//  weatherApp2.0
//
//  Created by F1xTeoNtTsS on 07.09.2021.
//

import UIKit

class ConfigView: UIView {
    let background = Background()
    
    let searchField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search"
        textField.textAlignment = .right
        textField.returnKeyType = .go
        textField.borderStyle = .roundedRect
        textField.clearsOnBeginEditing = true
        textField.alpha = 1
        textField.backgroundColor = .systemFill
        textField.tintColor = .label
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let locationButton: UIButton = {
       let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let searchButton: UIButton = {
       let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let currentWeatherImage: UIImageView = {
        let weatherImage = UIImageView()
        weatherImage.image = UIImage(systemName: "sun.max")
        weatherImage.tintColor = .label
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        return weatherImage
    }()
    
    let currentTemperatureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .label
        label.text = "21"
        label.font = UIFont.systemFont(ofSize: 80, weight: .black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let metricLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .label
        label.text = "°C"
        label.font = UIFont.systemFont(ofSize: 90, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cityNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .label
        label.text = "London"
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let temperatureStack = UIStackView()
    
    func setView(_ view: UIView){
        addSubview(view)
        setConstraints(view)
    }

    override func addSubview(_ view: UIView) {
        
        [background.backgroundView, locationButton,searchField,searchButton, currentWeatherImage,temperatureStack, cityNameLabel].forEach{view.addSubview($0)}
        [currentTemperatureLabel,metricLabel].forEach{temperatureStack.addArrangedSubview($0)}
    }
    
    func setConstraints(_ view: UIView){
        temperatureStack.axis = .horizontal
        temperatureStack.distribution = .fillEqually
        temperatureStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                    constant: Constants.gapConstant),
            locationButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                constant: Constants.gapConstant),
            locationButton.heightAnchor.constraint(equalToConstant: Constants.elementsHeight),
            locationButton.widthAnchor.constraint(equalTo: locationButton.heightAnchor),
            searchButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                   constant: Constants.trailingConstant),
            searchButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                              constant: Constants.gapConstant),
            searchButton.heightAnchor.constraint(equalToConstant: Constants.elementsHeight),
            searchButton.widthAnchor.constraint(equalTo: searchButton.heightAnchor),
            searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                             constant: Constants.gapConstant),
            searchField.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor,
                                                  constant: -(Constants.gapConstant)),
            searchField.leadingAnchor.constraint(equalTo: locationButton.trailingAnchor,
                                                 constant: Constants.gapConstant),
            searchField.heightAnchor.constraint(equalToConstant: Constants.elementsHeight),
            currentWeatherImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                          constant: Constants.trailingConstant),
            currentWeatherImage.topAnchor.constraint(equalTo: searchButton.bottomAnchor),
            currentWeatherImage.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor,
                                                        multiplier: Constants.imageViewHeight),
            currentWeatherImage.widthAnchor.constraint(equalTo: currentWeatherImage.heightAnchor),
            temperatureStack.topAnchor.constraint(equalTo: currentWeatherImage.bottomAnchor),
            temperatureStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                       constant: Constants.trailingConstant),
            temperatureStack.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor,
                                                    multiplier: Constants.temperatureWidth),
            temperatureStack.heightAnchor.constraint(equalTo: currentWeatherImage.heightAnchor),
            cityNameLabel.topAnchor.constraint(equalTo: temperatureStack.bottomAnchor),
            cityNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                    constant: Constants.trailingConstant),
            cityNameLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor,
                                                 multiplier: Constants.cityLabelWidth),
            cityNameLabel.heightAnchor.constraint(equalToConstant: Constants.elementsHeight)
        ])
    }
    
}


enum Constants {
    static let trailingConstant: CGFloat = -10
    static let gapConstant: CGFloat = 10
    static let imageViewHeight: CGFloat = 0.2
    static let temperatureWidth: CGFloat = 0.5
    static let cityLabelWidth: CGFloat = 0.3
    static let elementsHeight: CGFloat = 40
}
