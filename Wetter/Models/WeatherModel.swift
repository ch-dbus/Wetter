// WetterModell.swift
// Wetter
//
// Created by Dominik Bussinger on 15.07.2024.
//

import Foundation

struct WetterModell {
    let temperatur: String
    let windgeschwindigkeit: String
    let status: String
    
    init(wetterDaten: AktuellesWetter) {
        self.temperatur = "\(wetterDaten.temperatur)°C"
        self.windgeschwindigkeit = "\(wetterDaten.windgeschwindigkeit) km/h"
        self.status = WetterModell.getStatusFromCode(wetterDaten.wettercode)
    }
    
    static func getStatusFromCode(_ code: Int) -> String {
        switch code {
                case 0:
                    return "sun.max.fill" // Sonnig
                case 1, 2, 3:
                    return "cloud.sun.fill" // Teilweise bewölkt, Bewölkt
                case 45, 48:
                    return "cloud.fog.fill" // Nebel
                case 51, 53, 55:
                    return "cloud.drizzle.fill" // Nieselregen
                case 56, 57:
                    return "cloud.sleet.fill" // Gefrierender Nieselregen
                case 61, 63, 65:
                    return "cloud.rain.fill" // Regen
                case 66, 67:
                    return "cloud.sleet.fill" // Gefrierender Regen
                case 71, 73, 75:
                    return "cloud.snow.fill" // Schnee
                case 77:
                    return "snow" // Schneeschauer
                case 80, 81, 82:
                    return "cloud.heavyrain.fill" // Regenschauer
                case 85, 86:
                    return "cloud.snow.fill" // Schneeschauer
                case 95:
                    return "cloud.bolt.rain.fill" // Gewitter
                case 96, 99:
                    return "cloud.bolt.rain.fill" // Gewitter mit Hagel
                default:
                    return "questionmark.circle.fill" // Unbekannter Status
        }
    }
}
