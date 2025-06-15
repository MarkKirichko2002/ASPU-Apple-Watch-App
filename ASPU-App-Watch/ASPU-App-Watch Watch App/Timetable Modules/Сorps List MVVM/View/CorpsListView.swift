//
//  CorpsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 17.07.2024.
//

import SwiftUI

struct CorpsListView: View {
    
    @ObservedObject var viewModel = CorpsListViewModel()
    
    var body: some View {
        List(viewModel.corps) { corp in
            if viewModel.checkSwipeOption() {
                Text(corp.name)
                    .fontWeight(.bold)
                    .onTapGesture {
                        viewModel.isPresented.toggle()
                        viewModel.currentBuilding = corp
                     }
                    .swipeActions(edge: viewModel.getSwipeEdge().edge) {
                        Button {
                            viewModel.currentBuilding = corp
                            viewModel.isInfoSelected.toggle()
                        } label: {
                            Image("info")
                        }
                    }
            } else {
                Text(corp.name)
                    .fontWeight(.bold)
                    .onTapGesture {
                        viewModel.isPresented.toggle()
                        viewModel.currentBuilding = corp
                 }
            }
        }
        .navigationTitle("Корпуса")
        .onChange(of: viewModel.isInfoSelected) {
            viewModel.isInfoPresented.toggle()
        }
        .sheet(isPresented: $viewModel.isInfoPresented) {
            BuildingAudiencesInfoView(building: viewModel.currentBuilding)
        }
        .sheet(isPresented: $viewModel.isPresented, content: {
            AudiencesListView(building: viewModel.currentBuilding)
        })
    }
}

#Preview {
    CorpsListView()
}
