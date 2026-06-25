//
//  Saved Location.swift
//  SkyMat
//
//  Created by Antoneos Philip on 25/06/2026.
//

import Foundation
import SwiftData
@Model
class CityEntity:Identifiable{
    var id: UUID = UUID()
    var name: String?
    var region: String?
    var country: String?
    var lat: Double?
    var lon: Double?
    var img:String?
    var apiId: Int?
    init( name: String? = nil, region: String? = nil, country: String?=nil , lat: Double? = nil, lon: Double? = nil,img:String? = nil, apiId: Int? = nil ) {
        self.name = name
        self.region = region
        self.country = country
        self.lat = lat
        self.lon = lon
        self.img = img
        self.apiId = apiId
    }
}
