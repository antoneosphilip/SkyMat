//
//  Weather.swift
//  SkyMat
//
//  Created by Antoneos Philip on 22/06/2026.
//

import Foundation
struct Weather:Decodable{
    var location:Location
    var current:Current
    var forecast:Forecast
}
