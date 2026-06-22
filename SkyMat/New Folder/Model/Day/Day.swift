//
//  Day.swift
//  SkyMat
//
//  Created by Antoneos Philip on 22/06/2026.
//

import Foundation
struct Day:Decodable{
    var maxtemp_c:Float?
    var mintemp_c:Float?
    var avgtemp_c:Float?
    var maxwind_mph:Float?
    var totalsnow_cm:Float?
    var daily_will_it_rain:Int?
    var daily_will_it_snow:Int?
    var condition:Condition?

}
struct Condition:Decodable{
    var text:String?
    var icon:String?
    
}
