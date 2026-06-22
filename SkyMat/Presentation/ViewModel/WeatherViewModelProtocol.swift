//
//  WeatherViewModelProtocol.swift
//  SkyMat
//
//  Created by Antoneos Philip on 22/06/2026.
//

import Foundation
protocol WeatherViewModelProtocol{
   func fetchWeatherLatLon()
   func getForecastCount()->Int
   func getForecastDay(at index:Int)->Forecastday
   func isMorning()->Bool
}

