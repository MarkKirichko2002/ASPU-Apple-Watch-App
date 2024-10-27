//
//  PairInfoView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 06.08.2024.
//

import SwiftUI

struct PairInfoView: View {
    
    @ObservedObject var viewModel: PairInfoViewModel
    
    var body: some View {
        List(viewModel.pairInfo, id: \.self) { item in
            Text(item)
                .fontWeight(.bold)
                .onTapGesture {
                    viewModel.checkCell(item: item)
             }
        }
        .navigationTitle("Информация")
        .onAppear {
            viewModel.checkSettings()
        }
        .onDisappear {
            viewModel.stopUpdateInfo()
        }
        .sheet(isPresented: $viewModel.isPresented) {
            BuildingDetailView(building: viewModel.currentBuilding)
        }
    }
}

#Preview {
    PairInfoView(viewModel: PairInfoViewModel(pair: Discipline(id: "", time: "", name: "", groupName: "", teacherName: "", audienceID: "", subgroup: 0, type: .all), date: ""))
}
