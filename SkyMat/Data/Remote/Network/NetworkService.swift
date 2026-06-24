//
//  NetworkService.swift
//  SkyMate
//
//  Created by Antoneos Philip on 21/06/2026.
//

import Foundation
class NetworkService:NetworkServiceProtocol{
    private let apiConstant=ApiConstant()
    func fetchWeatherLocation(lat: Double, long: Double, completion: @escaping (Weather) -> Void) {

        guard let url = URL(string: "\(apiConstant.baseUrl)/forecast.json?\(apiConstant.apiKey)q=\(lat),\(long)&days=3&aqi=yes&alerts=no") else {
            return
        }

        let req = URLRequest(url: url)

        URLSession.shared.dataTask(with: req) { data, response, error in

            if let err = error {
                print(err)
                return
            }

            if let res = response as? HTTPURLResponse, res.statusCode != 200 {
                print("status code:", res.statusCode)
                return
            }

            guard let data = data else { return }

            do {
                let responseDecodable = try JSONDecoder().decode(Weather.self, from: data)
                completion(responseDecodable)
            } catch {
                print(error.localizedDescription)
            }

        }.resume() 
    }
}
