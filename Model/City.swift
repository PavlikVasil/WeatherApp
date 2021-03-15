//
//  City.swift
//  WeatherApp
//
//  Created by Павел on 12.03.2021.
//

import Foundation

struct City: Codable {
    var statusCode: String
    var cityData: [CityData]
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "cod"
        case cityData = "list"
    }
}

struct CityData: Codable {
    var cityId: Int
    var cityName: String
    var country: Country
    
    enum CodingKeys: String, CodingKey {
        case cityId = "id"
        case cityName = "name"
        case country = "sys"
    }
}

struct Country: Codable {
    var country: String
}
