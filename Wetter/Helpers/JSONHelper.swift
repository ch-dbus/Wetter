// JSONHelper.swift
// Wetter
//
// Created by Dominik Bussinger on 15.07.2024.
//

import Foundation

class JSONHelper {
    static func printJSONData(data: Data) {
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                print(json)
            }
        } catch {
            print("Fehler beim Serialisieren der JSON-Daten: \(error.localizedDescription)")
        }
    }
}
