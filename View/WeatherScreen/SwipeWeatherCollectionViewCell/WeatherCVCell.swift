//
//  WeatherCVCell.swift
//  WeatherApp
//
//  Created by Павел on 12.03.2021.
//

import UIKit

class WeatherCVCell: UICollectionViewCell {
    
    // MARK: - Properties
    let cellId = "cellId"
    var weatherForecastTVCViewModel: WeatherForecastTVCViewModel!
    
    // MARK: - UI elements
    var weatherDataStackView: UIStackView!
    var infoLabel: UILabel!
    var minMaxTempStackView: UIStackView!
    var minTempLabel: UILabel!
    var maxTempLabel: UILabel!
    var weatherForecastTableView: UITableView!
    var cityNameLabel: UILabel!
    var weatherLabel: UILabel!
    var weatherDescriptionLabel: UILabel!
    var temperatureLabel: UILabel!
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeWeatherForecastTableView()
        makeSeparationTopLine()
        makeSeparationBottomLine()
        makeInfoLabel()
        makeMinMaxTempStackView()
        makeMinMaxTempLabels()
        makeWeatherDataStackView()
        makeCityNameLable()
        makeWeatherLabel()
        makeWeatherDescriptionLabel()
        makeTemperatureLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
