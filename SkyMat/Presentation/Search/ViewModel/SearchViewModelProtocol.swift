//
//  SearchViewModelProtocol.swift
//  SkyMat
//
//  Created by Antoneos Philip on 24/06/2026.
//

import Foundation
protocol SearchViewModelProtocol{
    func getCountries()->[City]
    func getCountriesCount()->Int
    func searchCountryByName(name:String)
    
}
