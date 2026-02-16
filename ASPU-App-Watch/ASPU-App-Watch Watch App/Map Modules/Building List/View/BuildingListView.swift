//
//  BuildingListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 18.10.2024.
//

import SwiftUI

struct BuildingListView: View {
    
    @State var currentBuilding = Buildings.pins[0]
    @State var isSelected = false
    @State var isInfoSelected = false
    @State var isPresented = false
    @State var isInfoPresented = false
    
    // MARK: - сервисы
    private let settingsManager = SettingsManager()
    
    var body: some View {
        List(Buildings.pins) { building in
            if settingsManager.getSwipeOnOption() {
                HStack {
                    Text(building.name)
                        .fontWeight(.bold)
                    Spacer()
                }.contentShape(Rectangle())
                .onTapGesture {
                    currentBuilding = building
                    isSelected.toggle()
                }
                .swipeActions(edge: settingsManager.getSavedSwipeEdge().edge) {
                    Button {
                        currentBuilding = building
                        isInfoSelected.toggle()
                    } label: {
                        Image("info")
                    }
                }
            } else {
                HStack {
                    Text(building.name)
                        .fontWeight(.bold)
                    Spacer()
                }.contentShape(Rectangle())
                .onTapGesture {
                    currentBuilding = building
                    isSelected.toggle()
                }
            }
        }
        .navigationTitle("Корпуса")
        .onChange(of: isSelected) {
            isPresented.toggle()
        }
        .onChange(of: isInfoSelected) {
            isInfoPresented.toggle()
        }
        .sheet(isPresented: $isPresented) {
            BuildingDetailView(building: currentBuilding)
        }
        .sheet(isPresented: $isInfoPresented) {
            BuildingAudiencesInfoView(building: currentBuilding)
        }
    }
}

#Preview {
    BuildingListView()
}
