// StatusAnsicht.swift
// Wetter
//
// Created by Dominik Bussinger on 15.07.2024.
//

import SwiftUI

struct StatusView: View {
    var wetterStatus: String

    var body: some View {
        Image(systemName: wetterStatus)
            .font(.system(size: 200))
            .foregroundColor(.blue)
    }
}

struct StatusViewt_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            StatusView(wetterStatus: "sun.max.fill")
            StatusView(wetterStatus: "cloud.sun.fill")
            StatusView(wetterStatus: "cloud.fill")
            StatusView(wetterStatus: "cloud.heavyrain.fill")
        }
    }
}
