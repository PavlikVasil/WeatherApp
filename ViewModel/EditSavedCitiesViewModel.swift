//
//  EditSavedCitiesViewModel.swift
//  WeatherApp
//
//  Created by Павел on 12.03.2021.
//

import Foundation

class EditSavedCitiesViewModel {
    
    // MARK: - Properties
    var networkService: Networking!
    var dataSaverService: DataSaver!
    var cities = [Weather]()
    
    // MARK: - Initialization
    init(networkService: Networking, dataSaverService: DataSaver) {
        self.networkService = networkService
        self.dataSaverService = dataSaverService
    }
    
    // MARK: - Methods
    func fetchDataForCity(_ cityName: String, completion: @escaping (() -> ())) {
        let savedCities = dataSaverService.loadSavedCities()
        networkService.fetchWeatherDataFor(savedCities) { [weak self] in
            self?.cities = $0
            completion()
        }
    }
}
