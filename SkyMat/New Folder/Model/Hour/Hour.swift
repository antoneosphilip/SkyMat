//
//  Hour.swift
//  SkyMat
//
//  Created by Antoneos Philip on 22/06/2026.
//

import Foundation
struct Hour:Decodable,Identifiable{
    let id = UUID()
    var time:String?
    var temp_c:Float?
    var condition:Condition?
    var wind_mph:Float?
    var pressure_mb:Float?
    var humidity:Int?
    var cloud:Int?
    var feelslike_c:Float?
}
