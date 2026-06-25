//
//  City.swift
//  SkyMat
//
//  Created by Antoneos Philip on 24/06/2026.
//

import Foundation
import Foundation
struct City: Decodable,Identifiable {

    var id: Int?
    var name: String?
    var region: String?
    var country: String?
    var lat: Double?
    var lon: Double?
    var img:String?
}
