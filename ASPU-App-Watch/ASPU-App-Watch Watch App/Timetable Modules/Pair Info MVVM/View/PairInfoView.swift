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
        }
        .navigationTitle("Информация")
        .alert(isPresented: $viewModel.isAlert) {
            Alert(title: Text("Геопозиция выключена"))
        }
        .onAppear {
            viewModel.checkSettings()
        }
        .onDisappear {
            viewModel.stopUpdateInfo()
        }
    }
}

#Preview {
    PairInfoView(viewModel: PairInfoViewModel(pair: Discipline(id: "", time: "", name: "", groupName: "", teacherName: "", audienceID: "", subgroup: 0, type: .all), date: ""))
}
