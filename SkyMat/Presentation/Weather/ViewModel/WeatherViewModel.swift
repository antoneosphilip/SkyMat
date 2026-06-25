//
//  WeatherViewModel.swift
//  SkyMat
//
//  Created by Antoneos Philip on 22/06/2026.
//

import Foundation
internal import Combine
class WeatherViewModel:WeatherViewModelProtocol,ObservableObject{
    private var networkServices:NetworkService?
   @Published  private var current:Current?
   @Published  private var forecast:Forecast?
   @Published private var location:Location?
    @Published var lat:Double?
    @Published  var long:Double?
    @Published var isDay: Bool = true
    init(networkServices: NetworkService? = nil) {
        self.networkServices = networkServices
      
    }
    var forecastMutable: Forecast? {
       forecast
    }
    
     var forecastDays: [Forecastday] {
        forecast?.forecastday ?? []
     }
     var currentMutable: Current?{
         current
     }
     var locationMutable: Location?{
        location
     }
    
    func fetchWeatherLatLon() {
        let lat = self.lat ?? 30
        let lon = self.long ?? 31
        
        networkServices?.fetchWeatherLocation(lat: lat, long: lon, completion: { data in
            DispatchQueue.main.async {
                self.current = data.current
                self.forecast = data.forecast
                self.location = data.location
                self.isDay = data.current.is_day == 1
                print("Is Day",self.isDay)

            }
        })
    }
    func getForecastCount() -> Int {
        return (forecast?.forecastday.count) ?? 0
    }
    func getForecastDay(at index:Int)->Forecastday{
        return (forecast?.forecastday[index])!
    }
    func isMorning() -> Bool {
        return currentMutable?.is_day == 1  ? true : false
    }
}
