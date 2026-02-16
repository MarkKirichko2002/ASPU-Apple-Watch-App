//
//  BuildingAudiencesInfoView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 02.05.2025.
//

import SwiftUI

struct BuildingAudiencesInfoView: View {
    
    @State var isPresented = false
    var building: BuildingModel
    
    var body: some View {
        VStack(spacing: 25) {
            Image("door")
                .resizable()
                .frame(width: 55, height: 55)
                .onTapGesture {
                    isPresented.toggle()
                }
            Text(!building.audiences.isEmpty ? "Всего аудиторий: \(building.audiences.count)" : "Нет аудиторий")
                .fontWeight(.bold)
                .onTapGesture {
                    isPresented.toggle()
             }
        }.navigationTitle(building.name)
        .sheet(isPresented: $isPresented) {
            AudiencesListView(building: building)
        }
    }
}

//#Preview {
//    BuildingAudiencesInfoView()
//}
