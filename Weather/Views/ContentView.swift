//
//  ContentView.swift
//  Weather
//
//  Created by Kabir Dhillon on 2/3/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManger = LocationManager()
    
    var body: some View {
        VStack {
            if let location = locationManger.location {
                Text("Your coordinates are: \(location.latitude), \(location.latitude)")
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
