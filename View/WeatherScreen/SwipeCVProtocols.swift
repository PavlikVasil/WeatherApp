//
//  SwipeCVProtocols.swift
//  WeatherApp
//
//  Created by Павел on 12.03.2021.
//

import UIKit

extension WeatherViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        showHideNoDataForDisplayImageView()
        return weatherViewModel.cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! WeatherCVCell
        
        if isReloadViewCell{
            cell.weatherForecastTVCViewModel = WeatherForecastTVCViewModel(forecast: weatherViewModel.cities.first!.weatherForecastOnDay)
            
            let weather = weatherViewModel.cities.first!
            self.isReloadViewCell = false
            return cell.madeWithModelOf(weather)
        } else {
            
            cell.weatherForecastTVCViewModel = WeatherForecastTVCViewModel(forecast: weatherViewModel.cities[indexPath.row].weatherForecastOnDay)
            cell.weatherForecastTableView.reloadData()
            let weather = weatherViewModel.cities[indexPath.row]
            return cell.madeWithModelOf(weather)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

