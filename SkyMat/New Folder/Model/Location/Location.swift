//
//  Location.swift
//  SkyMat
//
//  Created by Antoneos Philip on 22/06/2026.
//

import Foundation
struct Location:Decodable{
    var name:String?
    var region:String?
    var country:String?
    var tz_id:String?
    var localtime:String?
    var lat:Double?
    var lon:Double?
}
