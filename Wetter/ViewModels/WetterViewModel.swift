// WetterAnsichtModell.swift
// Wetter
//
// Created by Dominik Bussinger on 15.07.2024.
//

import Foundation
import Combine
import CoreLocation

class WetterViewModel: ObservableObject {
    @Published var temperatur: String = ""
    @Published var windgeschwindigkeit: String = ""
    @Published var status: String = ""
    @Published var location: CLLocation? = nil {
        didSet {
            if let location = location {
                fetchWetter(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            }
        }
    }
    
    var standortManager = StandortManager()
      
      private var cancellables = Set<AnyCancellable>()
      
      init() {
          standortManager.$location
              .receive(on: RunLoop.main)
              .sink { [weak self] location in
                  self?.location = location
              }
              .store(in: &cancellables)
          
          standortManager.$authorizationStatus
              .receive(on: RunLoop.main)
              .sink { [weak self] status in
                  if status == .authorizedWhenInUse || status == .authorizedAlways {
                      self?.standortManager.startUpdatingLocation()
                  }
              }
              .store(in: &cancellables)
      }
      
      func fetchWetter(latitude: Double, longitude: Double) {
          APIClient.shared.fetchWetterDaten(latitude: latitude, longitude: longitude) { result in
              DispatchQueue.main.async {
                  switch result {
                  case .success(let wetterDaten):
                      let wetter = WetterModell(wetterDaten: wetterDaten.aktuellesWetter)
                      self.temperatur = wetter.temperatur
                      self.windgeschwindigkeit = wetter.windgeschwindigkeit
                      self.status = wetter.status
                  case .failure(let error):
                      print("Failed to fetch weather data: \(error.localizedDescription)")
                  }
              }
          }
      }
  }
