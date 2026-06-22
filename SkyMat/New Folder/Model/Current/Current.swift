//
//  Current.swift
//  SkyMat
//
//  Created by Antoneos Philip on 22/06/2026.
//

import Foundation
struct Current:Decodable{
    var temp_c:Float?
    var is_day:Int?
    var wind_mph:Float?
    var pressure_mb:Int?
    var humidity:Int?
    var cloud:Int?
    var vis_km:Int?
    var feelslike_c:Float?
    var condition:Condition?
    
    
}
