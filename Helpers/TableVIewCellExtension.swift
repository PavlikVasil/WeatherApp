//
//  TableVIewCellExtension.swift
//  WeatherApp
//
//  Created by Павел on 15.03.2021.
//

import UIKit

extension WeatherForecastTVCell {
    func madeWithModelOf(_ forecast: WeatherForecastOnDay) -> WeatherForecastTVCell {
        let weatherIcon = UIImage(named: forecast.weatherDescription.first!.icon)
        let minTemperature = String(format: "%.0f", forecast.temperature.min)
        let maxTemperature = String(format: "%.0f", forecast.temperature.max)
        
        self.timeLabel.text = forecast.date.formatted()
        self.weatherImageView.image = weatherIcon
        self.minTempLabel.text = minTemperature
        self.maxTempLabel.text = maxTemperature
        
        return self
    }
}
