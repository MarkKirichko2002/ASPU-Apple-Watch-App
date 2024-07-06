//
//  BuildingsMapView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 06.07.2024.
//

import SwiftUI
import MapKit

struct BuildingsMapView: View {
    
    @State var selected: Int?
    @State var isPresented = false
    @State var camera: MapCameraPosition = .automatic
    @State var currentLocation = Buildings.pins[0]
    
    var body: some View {
        Map(selection: $selected) {
            ForEach(Buildings.pins) { building in
                Marker(building.name, coordinate: building.pin).tag(building.id)
            }
        }
        .onChange(of: selected) { value in
            currentLocation = Buildings.pins[value ?? 0]
            isPresented.toggle()
        }
        .sheet(isPresented: $isPresented) {
            BuildingDetailView(building: currentLocation)
        }
        .navigationTitle("Карты")
    }
}

#Preview {
    BuildingsMapView()
}
