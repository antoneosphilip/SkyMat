//
//  SearchViewModel.swift
//  SkyMat
//
//  Created by Antoneos Philip on 24/06/2026.
//

import Foundation
internal import Combine

class SearchViewModel:SearchViewModelProtocol,ObservableObject{
    
    
    private var networkService=NetworkService()
    
    @Published private var cities :[City]?
    
    var citiesMutiable:[City]{
        cities ?? []
    }
    
    func getCountries() -> [City] {
        countries
    }
    
    func getCountriesCount() -> Int {
        countries.count

    }
    
    func searchCountryByName(name: String) {
        networkService.searchCountyByName(countryName: name, completion: {
            data in
            
            self.cities=data
        })
    }
    
    private let countries: [City] = [

        City(
            id: 1,
            name: "Cairo",
            region: "Cairo Governorate",
            country: "Egypt",
            lat: 30.0444,
            lon: 31.2357,
            img: "🇪🇬"
        ),

        City(
            id: 2,
            name: "Riyadh",
            region: "Riyadh Region",
            country: "Saudi Arabia",
            lat: 24.7136,
            lon: 46.6753,
            img: "🇸🇦"
        ),

        City(
            id: 3,
            name: "Doha",
            region: "Doha Municipality",
            country: "Qatar",
            lat: 25.2854,
            lon: 51.5310,
            img: "🇶🇦"
        ),

        City(
            id: 4,
            name: "Manama",
            region: "Capital Governorate",
            country: "Bahrain",
            lat: 26.2235,
            lon: 50.5876,
            img: "🇧🇭"
        ),

        City(
            id: 5,
            name: "Muscat",
            region: "Muscat Governorate",
            country: "Oman",
            lat: 23.5880,
            lon: 58.3829,
            img: "🇴🇲"
        ),

        City(
            id: 6,
            name: "Amman",
            region: "Amman Governorate",
            country: "Jordan",
            lat: 31.9539,
            lon: 35.9106,
            img: "🇯🇴"
        ),

        City(
            id: 7,
            name: "Beirut",
            region: "Beirut Governorate",
            country: "Lebanon",
            lat: 33.8938,
            lon: 35.5018,
            img: "🇱🇧"
        ),

        City(
            id: 8,
            name: "Damascus",
            region: "Damascus Governorate",
            country: "Syria",
            lat: 33.5138,
            lon: 36.2765,
            img: "🇸🇾"
        ),

        City(
            id: 9,
            name: "Baghdad",
            region: "Baghdad Governorate",
            country: "Iraq",
            lat: 33.3152,
            lon: 44.3661,
            img: "🇮🇶"
        ),

        City(
            id: 10,
            name: "Tripoli",
            region: "Tripoli District",
            country: "Libya",
            lat: 32.8872,
            lon: 13.1913,
            img: "🇱🇾"
        ),

        City(
            id: 11,
            name: "Tunis",
            region: "Tunis Governorate",
            country: "Tunisia",
            lat: 36.8065,
            lon: 10.1815,
            img: "🇹🇳"
        ),

        City(
            id: 12,
            name: "Algiers",
            region: "Algiers Province",
            country: "Algeria",
            lat: 36.7538,
            lon: 3.0588,
            img: "🇩🇿"
        ),

        City(
            id: 13,
            name: "Rabat",
            region: "Rabat-Salé-Kénitra",
            country: "Morocco",
            lat: 34.0209,
            lon: -6.8416,
            img: "🇲🇦"
        ),

        City(
            id: 14,
            name: "Khartoum",
            region: "Khartoum State",
            country: "Sudan",
            lat: 15.5007,
            lon: 32.5599,
            img: "🇸🇩"
        ),

        City(
            id: 15,
            name: "Ankara",
            region: "Central Anatolia",
            country: "Turkey",
            lat: 39.9334,
            lon: 32.8597,
            img: "🇹🇷"
        ),

        City(
            id: 16,
            name: "Paris",
            region: "Île-de-France",
            country: "France",
            lat: 48.8566,
            lon: 2.3522,
            img: "🇫🇷"
        ),

        City(
            id: 17,
            name: "Berlin",
            region: "Berlin",
            country: "Germany",
            lat: 52.5200,
            lon: 13.4050,
            img: "🇩🇪"
        ),

        City(
            id: 18,
            name: "Rome",
            region: "Lazio",
            country: "Italy",
            lat: 41.9028,
            lon: 12.4964,
            img: "🇮🇹"
        ),

        City(
            id: 19,
            name: "Madrid",
            region: "Community of Madrid",
            country: "Spain",
            lat: 40.4168,
            lon: -3.7038,
            img: "🇪🇸"
        ),

        City(
            id: 20,
            name: "London",
            region: "England",
            country: "United Kingdom",
            lat: 51.5072,
            lon: -0.1276,
            img: "🇬🇧"
        ),

        City(
            id: 21,
            name: "Washington",
            region: "District of Columbia",
            country: "United States",
            lat: 38.9072,
            lon: -77.0369,
            img: "🇺🇸"
        ),

        City(
            id: 22,
            name: "Ottawa",
            region: "Ontario",
            country: "Canada",
            lat: 45.4215,
            lon: -75.6972,
            img: "🇨🇦"
        ),

        City(
            id: 23,
            name: "Brasilia",
            region: "Federal District",
            country: "Brazil",
            lat: -15.7939,
            lon: -47.8828,
            img: "🇧🇷"
        ),

        City(
            id: 24,
            name: "Beijing",
            region: "Beijing Municipality",
            country: "China",
            lat: 39.9042,
            lon: 116.4074,
            img: "🇨🇳"
        ),

        City(
            id: 25,
            name: "Tokyo",
            region: "Tokyo Prefecture",
            country: "Japan",
            lat: 35.6762,
            lon: 139.6503,
            img: "🇯🇵"
        ),

        City(
            id: 26,
            name: "Moscow",
            region: "Moscow",
            country: "Russia",
            lat: 55.7558,
            lon: 37.6173,
            img: "🇷🇺"
        )
    ]
}
