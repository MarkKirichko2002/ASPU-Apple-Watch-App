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
        VStack {
            List(viewModel.pairInfo, id: \.self) { item in
                Text(item)
                    .fontWeight(.bold)
                    .onTapGesture {
                        viewModel.checkCell(item: item)
                 }
            }
        }
        .navigationTitle("Информация")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    self.viewModel.isListPresented.toggle()
                }) {
                    Image("sections")
                }.foregroundStyle(Color(UIColor.white))
            }
        }
        .onChange(of: viewModel.pair) { newValue in
            viewModel.pair = newValue
            viewModel.refreshData()
        }
        .onAppear {
            viewModel.checkSettings()
        }
        .onDisappear {
            viewModel.stopUpdateInfo()
        }
        .sheet(isPresented: $viewModel.isPresented) {
            BuildingDetailView(building: viewModel.currentBuilding)
        }
        .sheet(isPresented: $viewModel.isListPresented) {
            DisciplinesListView(currentPair: $viewModel.pair, pairs: viewModel.pairs)
        }
    }
}

//#Preview {
//    PairInfoView(viewModel: PairInfoViewModel(pair: Discipline(id: "", time: "", name: "", groupName: "", teacherName: "", audienceID: "", subgroup: 0, type: .all), date: ""))
//}
