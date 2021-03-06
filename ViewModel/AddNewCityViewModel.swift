//
//  AddNewCityViewModel.swift
//  WeatherApp
//
//  Created by Павел on 12.03.2021.
//

import Foundation

protocol AddNewCityViewModelDelegate {
    func showErrorAlertController(_ error: Error)
}

class AddNewCityViewModel {
    
    // MARK: - Properties
    var networkService: Networking!
    var dataSaverService: DataSaver!
    var cityData = [City]()
    var delegate: AddNewCityViewModelDelegate?
    
    // MARK: - Initialization
    init(networkService: Networking, dataSaverService: DataSaver) {
        self.networkService = networkService
        self.dataSaverService = dataSaverService
    }
    
    // MARK: - Methods
    func fetchDataForCity(_ cityName: String, completion: @escaping (() -> ())) {
        networkService.fetchCityDataFor(cityName) { [weak self] (data, error)in
            guard let data = data else {
                guard let error = error else { return }
                self?.delegate?.showErrorAlertController(error)
                return
            }
            self?.cityData = []
            self?.cityData = data
            completion()
        }
    }
}
