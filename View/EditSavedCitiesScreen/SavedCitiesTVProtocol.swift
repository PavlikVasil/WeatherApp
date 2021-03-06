//
//  SavedCitiesTVProtocol.swift
//  WeatherApp
//
//  Created by Павел on 12.03.2021.
//

import UIKit

extension EditSavedCitiesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return editSavedCitiesViewModel.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let cityInfo = editSavedCitiesViewModel.cities[indexPath.row]
        
        cell.textLabel?.textColor = #colorLiteral(red: 0.4274446338, green: 0.4274446338, blue: 0.4274446338, alpha: 1)
        cell.backgroundColor = .clear
        cell.textLabel?.text = "\(cityInfo.city.name), \(cityInfo.city.country)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let cityForDelete = editSavedCitiesViewModel.cities[indexPath.row]
            var allCities = editSavedCitiesViewModel.dataSaverService.loadSavedCities()
            allCities.removeAll(where: { $0 == cityForDelete.city.id })
            
            editSavedCitiesViewModel.dataSaverService.saveCities(allCities)
            editSavedCitiesViewModel.cities.remove(at: indexPath.row)

            tableView.deleteRows(at: [indexPath], with: .automatic)

            unwindEditSavedCitiesVCAndReloadData()
            
        }
    }
    
    
    
}
