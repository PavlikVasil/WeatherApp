//
//  WeatherForecastTVCViewModel.swift
//  WeatherApp
//
//  Created by Павел on 12.03.2021.
//

import Foundation

class WeatherForecastTVCViewModel {
    
    // MARK: - Properties
    var forecast = [WeatherForecastOnDay]()
    
    // MARK: - Initialization
    init(forecast: [WeatherForecastOnDay]) {
        self.forecast = forecast
    }
    
}
