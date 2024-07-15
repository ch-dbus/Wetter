// TemperaturAnsicht.swift
// Wetter
//
// Created by Dominik Bussinger on 15.07.2024.
//

import SwiftUI

struct TemperaturView: View {
    var temperatur: String

    var body: some View {
        HStack {
            Image(systemName: "thermometer")
                .font(.title)
                .foregroundColor(temperaturFarbe)
            Text(temperatur)
                .font(.title)
                .foregroundColor(temperaturFarbe)
        }
    }

    private var temperaturFarbe: Color {
        guard let tempValue = Double(temperatur.replacingOccurrences(of: "°C", with: "")) else {
            return .black
        }

        switch tempValue {
        case ..<0:
            return .blue
        case 0..<10:
            return .cyan
        case 10..<20:
            return .green
        case 20..<30:
            return .orange
        case 30...:
            return .red
        default:
            return .black
        }
    }
}

struct TemperaturView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TemperaturView(temperatur: "-5°C")
            TemperaturView(temperatur: "5°C")
            TemperaturView(temperatur: "15°C")
            TemperaturView(temperatur: "25°C")
            TemperaturView(temperatur: "35°C")
        }
    }
}
