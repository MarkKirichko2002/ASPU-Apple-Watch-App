//
//  BuildingTypeView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 09.08.2024.
//

import SwiftUI
import MapKit

struct BuildingTypeView: View {
    
    var buildings: [BuildingModel]
    @ObservedObject var viewModel = BuildingTypeViewModel()
    
    var body: some View {
        Map(position: $viewModel.camera, selection: $viewModel.selected) {
            ForEach(buildings) { building in
                Marker(building.name, coordinate: building.pin).tag(viewModel.getBuildingID(building: building))
            }
        }
        .navigationTitle("Здания: \(buildings.count - 1)")
        .toolbar {
            if viewModel.checkNavigationBar() {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button(action: {
                            viewModel.pastLocation()
                        }) {
                            Image(systemName: "arrow.left")
                        }.foregroundStyle(Color(viewModel.getArrowColor().color))
                        
                        Spacer()
                        
                        Button(action: {
                            viewModel.nextLocation()
                        }) {
                            Image(systemName: "arrow.right")
                        }.foregroundStyle(Color(viewModel.getArrowColor().color))
                    }
                }
            }
        }
        .onAppear {
            viewModel.setUpData(buildings: buildings)
        }
        .onChange(of: viewModel.selected) { value in
            guard let index = value else {return}
            if index != viewModel.indexOfUserLocation() {
                viewModel.currentLocation = viewModel.buildings[index]
                viewModel.isPresented.toggle()
            }
        }
        .sheet(isPresented: $viewModel.isPresented) {
            BuildingDetailView(building: viewModel.currentLocation)
        }
    }
}

#Preview {
    BuildingTypeView(buildings: [])
}
