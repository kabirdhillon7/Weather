//
//  WeatherManager.swift
//  Weather
//
//  Created by Kabir Dhillon on 2/4/23.
//

import Foundation
import CoreLocation

class WeatherManager {
    
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\("abcd")&units=imperial") else {
            fatalError("Missing Url")
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching Weather data")
        }
        
    }
}
