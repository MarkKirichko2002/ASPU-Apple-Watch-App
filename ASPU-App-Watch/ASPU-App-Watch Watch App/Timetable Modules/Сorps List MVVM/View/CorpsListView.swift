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
            Text(corp.name)
                .onTapGesture {
                    viewModel.isPresented.toggle()
                    viewModel.currentBuilding = corp
             }
        }
        .navigationTitle("Корпуса")
        .sheet(isPresented: $viewModel.isPresented, content: {
            AudenciesListView(building: viewModel.currentBuilding)
        })
    }
}

#Preview {
    CorpsListView()
}
