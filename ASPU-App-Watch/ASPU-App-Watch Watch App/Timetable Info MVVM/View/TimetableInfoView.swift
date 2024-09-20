//
//  TimetableInfoView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 12.09.2024.
//

import SwiftUI

struct TimetableInfoView: View {
    
    @ObservedObject var viewModel = TimetableInfoViewModel()
    
    var body: some View {
        VStack(spacing: 25) {
            Image("clock")
                .resizable()
                .frame(width: 55, height: 55)
            Text(viewModel.info[0])
                .fontWeight(.bold)
        }.navigationTitle("Расписание")
        .onAppear {
            viewModel.getTimetable()
        }
    }
}

#Preview {
    TimetableInfoView()
}
