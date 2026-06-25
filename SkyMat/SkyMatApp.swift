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
        _weatherViewModel = StateObject(wrappedValue: vm)
    }

    var body: some Scene {
        WindowGroup {

            NavigationStack(path: $router.path) {
                WeatherView(
                    weatherViewModel: weatherViewModel,
                    router: router
                )
                .navigationDestination(for: Route.self) { route in
                    switch route {

                    case .details(let index):
                        WeatherDetails(
                            forestDay: weatherViewModel.forecastDays[index],
                            textColor: weatherViewModel.isDay ? .black : .white,
                            videoMode: weatherViewModel.isDay ? "morninig" : "night"
                        )

                    case .search:
                        SearchView(
                            mode: weatherViewModel.isDay ? "morninig" : "night",
                            router: router,
                            textColor: weatherViewModel.isMorning() ? .black : .white,
                            weatherViewModel: weatherViewModel
                        )

                    case .savedLocations:
                        SavedLocationsView(
                            weatherViewModel: weatherViewModel,
                            router: router
                        )
                    }
                }
            }
        }
        .modelContainer(for: CityEntity.self) { result in

            guard let container = try? result.get() else {
                weatherViewModel.fetchWeatherLatLon()
                return
            }

            let context = container.mainContext

            do {
                let cities = try context.fetch(
                    FetchDescriptor<CityEntity>()
                )

                if let lastCity = cities.last {
                    weatherViewModel.lat = lastCity.lat
                    weatherViewModel.long = lastCity.lon
                }

                weatherViewModel.fetchWeatherLatLon()

            } catch {
                print("Failed to fetch saved cities: \(error)")
                weatherViewModel.fetchWeatherLatLon()
            }
        }
    }
}
