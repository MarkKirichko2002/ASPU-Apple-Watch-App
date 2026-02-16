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
                Marker(building.name, coordinate: building.pin).tag(viewModel.getBuildingID(building: building))
            }
        }
        .navigationTitle("Карты")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    viewModel.isPresentedOptions.toggle()
                }) {
                    Image("sections")
                }.foregroundStyle(Color(UIColor.white))
            }
        }
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
            viewModel.getLocation()
        }
        .onChange(of: viewModel.selected) { value in
            guard let index = value else {return}
            if index != 0 {
                viewModel.currentLocation = viewModel.buildings[index]
                viewModel.isPresented.toggle()
            }
        }.alert(isPresented: $viewModel.alert) {
            Alert(title: Text("Больше локаций нет"))
        }
        .sheet(isPresented: $viewModel.isPresentedOptions) {
            BuildingFilterTypeListView(buildings: viewModel.buildings)
        }
        .sheet(isPresented: $viewModel.isPresented) {
            BuildingDetailView(building: viewModel.currentLocation)
        }
    }
}

#Preview {
    BuildingsMapView()
}
