//
//  WeatherForecastTVProtocols.swift
//  WeatherApp
//
//  Created by Павел on 12.03.2021.
//

import UIKit

extension WeatherCVCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let forecast = weatherForecastTVCViewModel.forecast
        return forecast.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.size.height / 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! WeatherForecastTVCell
        let forecast = weatherForecastTVCViewModel.forecast[indexPath.row]
        
        return cell.madeWithModelOf(forecast)
    }
}
