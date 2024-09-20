//
//  AudiencesListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 18.07.2024.
//

import SwiftUI

struct AudiencesListView: View {
    
    var building: BuildingModel
    @ObservedObject var viewModel = AudiencesListViewModel()
    
    var body: some View {
        
        VStack {
            if building.audiences.count > 0 {
                List(building.audiences, id: \.self) { audience in
                    AudienceCell(audience: audience, isSelected: viewModel.isSavedAudience(audience: audience))
                        .onTapGesture {
                            viewModel.currentAudience = audience
                            viewModel.isSelected.toggle()
                     }
                }
            } else {
                Text("Нет аудиторий")
                    .fontWeight(.bold)
            }
        }
        .navigationTitle(building.name)
        .onChange(of: viewModel.isSelected) {
            viewModel.isPresented.toggle()
        }
        .sheet(isPresented: $viewModel.isPresented, content: {
            TimetableDayResultListView(id: viewModel.currentAudience, date: viewModel.getCurrentDate(), owner: "CLASSROOM")
        })
    }
}

#Preview {
    AudiencesListView(building: Buildings.pins[0])
}
