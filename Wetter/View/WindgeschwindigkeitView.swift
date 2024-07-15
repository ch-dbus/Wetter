// WindgeschwindigkeitAnsicht.swift
// Wetter
//
// Created by Dominik Bussinger on 15.07.2024.
//

import SwiftUI

struct WindgeschwindigkeitView: View {
    var windgeschwindigkeit: String

    var body: some View {
        HStack {
            Image(systemName: "wind")
                .font(.title)
                .foregroundColor(windgeschwindigkeitFarbe)
            Text(windgeschwindigkeit)
                .font(.title)
                .foregroundColor(windgeschwindigkeitFarbe)
        }
    }

    private var windgeschwindigkeitFarbe: Color {
        guard let windValue = Double(windgeschwindigkeit.replacingOccurrences(of: " km/h", with: "")) else {
            return .black
        }

        switch windValue {
        case ..<10:
            return .green
        case 10..<20:
            return .yellow
        case 20..<30:
            return .orange
        case 30...:
            return .red
        default:
            return .black
        }
    }
}

struct WindgeschwindigkeitView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            WindgeschwindigkeitView(windgeschwindigkeit: "5 km/h")
            WindgeschwindigkeitView(windgeschwindigkeit: "15 km/h")
            WindgeschwindigkeitView(windgeschwindigkeit: "25 km/h")
            WindgeschwindigkeitView(windgeschwindigkeit: "35 km/h")
        }
    }
}
