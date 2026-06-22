//
//  Forecast.swift
//  SkyMat
//
//  Created by Antoneos Philip on 22/06/2026.
//

import Foundation
struct Forecast:Decodable{
    var forecastday:[Forecastday]
}
struct Forecastday:Decodable{
    var date:String?
    var day:Day?
    var astro:Astro?
    var hour:[Hour]
}
struct Astro:Decodable{
    var sunrise:String?
    var sunset:String?
    var moonrise:String?
    var moonset:String?
    var moon_phase:String?
    
}
