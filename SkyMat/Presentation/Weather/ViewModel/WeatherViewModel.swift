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
    var lat:Double?
    var long:Double?
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
    
    func fetchWeatherLatLon(){
        let Lat=self.lat ?? 30
        
        let lon=self.long ?? 31
        
        networkServices?.fetchWeatherLocation(lat: Lat, long: lon, completion: {
            data in
            self.current=data.current
            self.forecast=data.forecast
            self.location=data.location
            print("data\(data.current.cloud)")

        })
    }
    
    func getForecastCount() -> Int {
        return (forecast?.forecastday.count) ?? 0
    }
    func getForecastDay(at index:Int)->Forecastday{
        return (forecast?.forecastday[index])!
    }
    func isMorning() -> Bool {
        print("Is Day",currentMutable?.is_day)
        return currentMutable?.is_day == 1  ? true : false
    }
}
