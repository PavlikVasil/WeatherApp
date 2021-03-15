//
//  IntExtension.swift
//  WeatherApp
//
//  Created by Павел on 15.03.2021.
//

import Foundation

extension Int {
    func formatted() -> String {
        let date = Date(timeInterval: TimeInterval(self), since: Date(timeIntervalSince1970: 0))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d  HH:mm"
        
        return dateFormatter.string(from: date)
    }
}
