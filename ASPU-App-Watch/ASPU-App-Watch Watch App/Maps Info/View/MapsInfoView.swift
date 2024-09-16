//
//  MapsInfoView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 16.09.2024.
//

import SwiftUI

struct MapsInfoView: View {
    
    @ObservedObject var viewModel = MapsInfoViewModel()
    
    var body: some View {
        VStack(spacing: 25) {
            Image("info icon")
                .resizable()
                .frame(width: 55, height: 55)
                .onTapGesture {
                    handleTap()
                }
            Text(viewModel.info[0])
                .fontWeight(.bold)
            Text(viewModel.info[1])
                .fontWeight(.bold)
        }.navigationTitle(viewModel.text)
            .sheet(isPresented: $viewModel.isPresented) {
                BuildingDetailView(building: viewModel.currentBuidling)
            }
        .onAppear {
            viewModel.checkLocationAuthorizationStatus()
        }
    }
    
    func handleTap() {
        if !viewModel.info[1].isEmpty {
            viewModel.isPresented.toggle()
        }
    }
}

#Preview {
    MapsInfoView()
}
