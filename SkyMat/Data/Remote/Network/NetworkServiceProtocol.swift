//
//  NetworkServiceProtocol.swift
//  SkyMate
//
//  Created by Antoneos Philip on 21/06/2026.
//

import Foundation
protocol NetworkServiceProtocol {
    
    func fetchWeatherLocation(lat:Double,long:Double,completion: @escaping (Weather)->Void)
}
