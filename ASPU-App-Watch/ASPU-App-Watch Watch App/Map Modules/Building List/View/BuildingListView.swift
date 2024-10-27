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
    @State var isPresented = false
    
    var body: some View {
        List(Buildings.pins) { building in
            Text(building.name)
                .fontWeight(.bold)
                .onTapGesture {
                    currentBuilding = building
                    isSelected.toggle()
                }
        }
        .navigationTitle("Корпуса")
        .onChange(of: isSelected) {
            isPresented.toggle()
        }
        .sheet(isPresented: $isPresented) {
            BuildingDetailView(building: currentBuilding)
        }
    }
}

#Preview {
    BuildingListView()
}
