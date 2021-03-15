//
//  StringExtension.swift
//  WeatherApp
//
//  Created by Павел on 15.03.2021.
//

import Foundation

extension String {
    func createUrl(forRequestWith querys: [String: String]) -> URL? {
        guard let url = URL(string: self) else { return nil }
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        urlComponents?.queryItems = querys.map { URLQueryItem(name: $0.key, value: $0.value) }
        return urlComponents?.url
    }
}
