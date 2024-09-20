//
//  AppVersionInfoView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 19.09.2024.
//

import SwiftUI

struct AppVersionInfoView: View {
    
    @ObservedObject var viewModel = AppVersionInfoViewModel()
    
    var body: some View {
        VStack(spacing: 25) {
            Image("info icon")
                .resizable()
                .frame(width: 55, height: 55)
            Text(viewModel.info)
                .fontWeight(.bold)
        }.navigationTitle("Приложение")
        .onAppear {
            viewModel.getInfo()
        }
    }
}

#Preview {
    AppVersionInfoView()
}
