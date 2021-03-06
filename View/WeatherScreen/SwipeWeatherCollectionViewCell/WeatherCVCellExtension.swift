//
//  WeatherCVCellExtension.swift
//  WeatherApp
//
//  Created by Павел on 12.03.2021.
//

import UIKit

extension WeatherCVCell {
    
    // MARK: - UI Configuration
    func makeWeatherDataStackView() {
        weatherDataStackView = UIStackView()
        weatherDataStackView.translatesAutoresizingMaskIntoConstraints = false
        weatherDataStackView.axis = .vertical
        weatherDataStackView.alignment = .center
        weatherDataStackView.distribution = .fillProportionally
        
        self.addSubview(weatherDataStackView)
        
        let weatherDataStackViewConstraints = [
            weatherDataStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            weatherDataStackView.bottomAnchor.constraint(equalTo: infoLabel.topAnchor),
            weatherDataStackView.centerXAnchor.constraint(equalTo: centerXAnchor)]
        NSLayoutConstraint.activate(weatherDataStackViewConstraints)
    }
    
    func makeCityNameLable() {
        cityNameLabel = UILabel()
        cityNameLabel.font = .boldSystemFont(ofSize: 35)
        cityNameLabel.textColor = .white
        cityNameLabel.textAlignment = .center
        cityNameLabel.text = "--"
        cityNameLabel.layer.shadowColor = UIColor.black.cgColor
        cityNameLabel.layer.shadowOpacity = 0.4
        cityNameLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        weatherDataStackView.addArrangedSubview(cityNameLabel)
    }
    
    func makeWeatherLabel() {
        weatherLabel = UILabel()
        weatherLabel.font = .systemFont(ofSize: 30)
        weatherLabel.textColor = .white
        weatherLabel.layer.shadowOpacity = 0.4
        weatherLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        weatherDataStackView.addArrangedSubview(weatherLabel)
    }
    
    func makeWeatherDescriptionLabel() {
        weatherDescriptionLabel = UILabel()
        weatherDescriptionLabel.font = .systemFont(ofSize: 20)
        weatherDescriptionLabel.textColor = .white
        weatherDescriptionLabel.layer.shadowColor = UIColor.black.cgColor
        weatherDescriptionLabel.layer.shadowOpacity = 0.4
        weatherDescriptionLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        weatherDataStackView.addArrangedSubview(weatherDescriptionLabel)
    }
    
    func makeTemperatureLabel() {
        temperatureLabel = UILabel()
        temperatureLabel.font = .boldSystemFont(ofSize: 100)
        temperatureLabel.textColor = .white
        temperatureLabel.textAlignment = .center
        temperatureLabel.text = "--"
        temperatureLabel.layer.shadowColor = UIColor.black.cgColor
        temperatureLabel.layer.shadowOpacity = 0.4
        temperatureLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        weatherDataStackView.addArrangedSubview(temperatureLabel)
    }
    
    func makeInfoLabel() {
        infoLabel = UILabel()
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.textColor = .white
        infoLabel.text = "Min / Max t° now:"
        
        self.addSubview(infoLabel)
        
        let infoLabelConstraints = [
            infoLabel.bottomAnchor.constraint(equalTo: weatherForecastTableView.topAnchor, constant: -10),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)]
        NSLayoutConstraint.activate(infoLabelConstraints)
    }
    
    func makeMinMaxTempStackView() {
        minMaxTempStackView = UIStackView()
        minMaxTempStackView.distribution = .fillEqually
        minMaxTempStackView.spacing = 20
        minMaxTempStackView.axis = .horizontal
        minMaxTempStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(minMaxTempStackView)
        
        let minMaxTempStackViewConstraints = [
            minMaxTempStackView.bottomAnchor.constraint(equalTo: weatherForecastTableView.topAnchor, constant: -10),
            minMaxTempStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            minMaxTempStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3)]
        NSLayoutConstraint.activate(minMaxTempStackViewConstraints)
    }
    
    func makeMinMaxTempLabels() {
        minTempLabel = UILabel()
        minTempLabel.textColor = .white
        minTempLabel.textAlignment = .right
        minTempLabel.text = "--"
        
        minMaxTempStackView.addArrangedSubview(minTempLabel)
        
        maxTempLabel = UILabel()
        maxTempLabel.textColor = .white
        maxTempLabel.textAlignment = .right
        maxTempLabel.text = "--"
        
        minMaxTempStackView.addArrangedSubview(maxTempLabel)
    }
    
    func makeWeatherForecastTableView() {
        weatherForecastTableView = UITableView()
        weatherForecastTableView.translatesAutoresizingMaskIntoConstraints = false
        weatherForecastTableView.separatorStyle = .none
        weatherForecastTableView.showsVerticalScrollIndicator = false
        weatherForecastTableView.backgroundColor = .clear
        weatherForecastTableView.allowsSelection = false
        
        self.addSubview(weatherForecastTableView)
        
        weatherForecastTableView.register(WeatherForecastTVCell.self, forCellReuseIdentifier: cellId)
        
        weatherForecastTableView.delegate = self
        weatherForecastTableView.dataSource = self
        
        let weatherForecastOnDayTableViewConstraints = [
            weatherForecastTableView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            weatherForecastTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            weatherForecastTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            weatherForecastTableView.trailingAnchor.constraint(equalTo: trailingAnchor)]
        NSLayoutConstraint.activate(weatherForecastOnDayTableViewConstraints)
    }
    
    func makeSeparationTopLine() {
        let separationTopLine = UIView()
        separationTopLine.backgroundColor = .white
        separationTopLine.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(separationTopLine)
        
        let separationTopLineConstraints = [
            separationTopLine.topAnchor.constraint(equalTo: weatherForecastTableView.topAnchor),
            separationTopLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            separationTopLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            separationTopLine.heightAnchor.constraint(equalToConstant: 1)]
        NSLayoutConstraint.activate(separationTopLineConstraints)
    }
    
    func makeSeparationBottomLine() {
        let separationBottomLine = UIView()
        separationBottomLine.backgroundColor = .white
        separationBottomLine.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(separationBottomLine)
        
        let separationBottomLineConstraints = [
            separationBottomLine.bottomAnchor.constraint(equalTo: weatherForecastTableView.bottomAnchor),
            separationBottomLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            separationBottomLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            separationBottomLine.heightAnchor.constraint(equalToConstant: 1)]
        NSLayoutConstraint.activate(separationBottomLineConstraints)
    }
}
