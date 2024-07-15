// APIClient.swift
// Wetter
//
// Created by Dominik Bussinger on 15.07.2024.
//

import Foundation

struct WetterDaten: Codable {
    let aktuellesWetter: AktuellesWetter

    enum CodingKeys: String, CodingKey {
        case aktuellesWetter = "current_weather"
    }
}

struct AktuellesWetter: Codable {
    let temperatur: Double
    let windgeschwindigkeit: Double
    let wettercode: Int

    enum CodingKeys: String, CodingKey {
        case temperatur = "temperature"
        case windgeschwindigkeit = "windspeed"
        case wettercode = "weathercode"
    }
}

class APIClient {
    static let shared = APIClient()
    private let baseURL = "https://api.open-meteo.com/v1/forecast"
    
    func fetchWetterDaten(latitude: Double, longitude: Double, completion: @escaping (Result<WetterDaten, Error>) -> Void) {
        let urlString = "\(baseURL)?latitude=\(latitude)&longitude=\(longitude)&current_weather=true"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }
            
            JSONHelper.printJSONData(data: data)
            
            do {
                let wetterAntwort = try JSONDecoder().decode(WetterDaten.self, from: data)
                completion(.success(wetterAntwort))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
