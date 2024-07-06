//
//  BuildingsMapView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 06.07.2024.
//

import SwiftUI
import MapKit

struct BuildingsMapView: View {
    
    @ObservedObject var viewModel = BuildingsMapViewModel()
    
    var body: some View {
        Map(position: $viewModel.camera, selection: $viewModel.selected) {
            ForEach(viewModel.buildings) { building in
                let index = viewModel.indexOfBuilding(building: building)
                Marker(building.name, coordinate: building.pin).tag(index)
            }
        }
        .onAppear {
            viewModel.getLocations()
        }
        .onChange(of: viewModel.selected) { value in
            guard let index = value else {return}
            if index != 9 {
                viewModel.currentLocation = Buildings.pins[index]
                viewModel.isPresented.toggle()
            }
        }
        .sheet(isPresented: $viewModel.isPresented) {
            BuildingDetailView(building: viewModel.currentLocation)
        }
        .navigationTitle("Карты")
    }
}

#Preview {
    BuildingsMapView()
}
