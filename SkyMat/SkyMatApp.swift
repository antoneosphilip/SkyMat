//
//  SkyMatApp.swift
//  SkyMat
//
//  Created by Antoneos Philip on 22/06/2026.
//

import SwiftUI
import SwiftData
@main
struct SkyMatApp: App {

    let networkServices = NetworkService()

    @StateObject private var weatherViewModel: WeatherViewModel
    @StateObject private var router = Router()

    init() {
        let vm = WeatherViewModel(networkServices: networkServices)
        vm.fetchWeatherLatLon()
        _weatherViewModel = StateObject(wrappedValue: vm)
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                WeatherView(weatherViewModel: weatherViewModel)
                    .environmentObject(weatherViewModel)
                    .environmentObject(router)
                    .navigationDestination(for: Route.self) { route in
                        switch route {

                        case .details(let index):
                            
                            WeatherDetails(forestDay:weatherViewModel.forecastDays[0], textColor: Color(.black))

                     
                        case .search:
                            ContentView()
                        case .savedLocations:
                            ContentView()
                        }
                        
                    }
            }
        }
    }
}
