//
//  CollectionViewCellExtension.swift
//  WeatherApp
//
//  Created by Павел on 15.03.2021.
//

import Foundation

extension WeatherCVCell {
    func madeWithModelOf(_ weather: Weather) -> WeatherCVCell {
        let temperature = String(format: "%.0f", weather.weatherForecastOnDay.first!.temperature.current)
        let minTemperature = String(format: "%.0f", weather.weatherForecastOnDay.first!.temperature.min)
        let maxTemperature = String(format: "%.0f", weather.weatherForecastOnDay.first!.temperature.max)

        self.cityNameLabel.text = weather.city.name
        self.weatherLabel.text = weather.weatherForecastOnDay.first?.weatherDescription.first?.short
        self.weatherDescriptionLabel.text = weather.weatherForecastOnDay.first?.weatherDescription.first?.full
        switch self.weatherLabel.text{
        case "Clouds":
            self.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        case "Snow":
            self.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        case "Thunderstorm":
            self.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        case "Rain":
            self.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        case "Clear":
            self.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        default:
            self.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        }
        self.temperatureLabel.text = temperature + "°"
        
        self.minTempLabel.text = minTemperature
        self.maxTempLabel.text = maxTemperature
        
        self.weatherForecastTVCViewModel.forecast = weather.weatherForecastOnDay
        
        return self
    }
}
