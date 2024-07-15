// WetterAnsicht.swift
// Wetter
//
// Created by Dominik Bussinger on 15.07.2024.
//

import SwiftUI

struct WetterView: View {
    @StateObject private var viewModel = WetterViewModel()
    
    var body: some View {
        VStack {
            if let location = viewModel.location {
                StatusView(wetterStatus: viewModel.status)
                VStack(spacing: 20) {
                    TemperaturView(temperatur: viewModel.temperatur)
                    WindgeschwindigkeitView(windgeschwindigkeit: viewModel.windgeschwindigkeit)
                }
                .padding(.top, 20)
            } else {
                Text("Standort wird abgerufen...")
            }
        }
        .onAppear {
            viewModel.standortManager.startUpdatingLocation()
        }
    }
}

struct WetterView_Previews: PreviewProvider {
    static var previews: some View {
        WetterView()
    }
}
