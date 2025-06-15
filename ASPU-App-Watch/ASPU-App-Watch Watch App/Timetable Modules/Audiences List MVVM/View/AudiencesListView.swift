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
                    if viewModel.checkSwipeOption() {
                        AudienceCell(audience: audience, isSelected: viewModel.isSavedAudience(audience: audience))
                            .onTapGesture {
                                viewModel.currentAudience = audience
                                viewModel.isSelected.toggle()
                            }
                            .swipeActions(edge: viewModel.getSwipeEdge().edge) {
                                Button {
                                    viewModel.currentAudience = audience
                                    viewModel.isInfoSelected.toggle()
                                } label: {
                                    Image("info")
                                }
                            }
                    } else {
                        AudienceCell(audience: audience, isSelected: viewModel.isSavedAudience(audience: audience))
                            .onTapGesture {
                                viewModel.currentAudience = audience
                                viewModel.isSelected.toggle()
                         }
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
        .onChange(of: viewModel.isInfoSelected) {
            viewModel.isInfoPresented.toggle()
        }
        .sheet(isPresented: $viewModel.isPresented, content: {
            TimetableDayResultListView(id: viewModel.currentAudience, date: viewModel.getCurrentDate(), owner: "CLASSROOM")
        })
        .sheet(isPresented: $viewModel.isInfoPresented, content: {
            TimetableDayInfoView(id: viewModel.currentAudience, owner: "CLASSROOM")
        })
    }
}

#Preview {
    AudiencesListView(building: Buildings.pins[0])
}
