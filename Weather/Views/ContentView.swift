//
//  ContentView.swift
//  Weather
//
//  Created by Kabir Dhillon on 2/3/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManger = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            if let location = locationManger.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if locationManger.isLoading {
                    LoadingView()
                } else {
                    WelcomeView().environmentObject(locationManger)
                }
            }
        }
        .background(Color(red: 0.0, green: 0.094, blue: 0.475))
        .preferredColorScheme(.dark)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
