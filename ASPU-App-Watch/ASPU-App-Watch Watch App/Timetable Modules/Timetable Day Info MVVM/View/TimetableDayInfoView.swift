//
//  TimetableDayInfoView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 12.09.2024.
//

import SwiftUI

struct TimetableDayInfoView: View {
    
    @ObservedObject var viewModel = TimetableInfoViewModel()
    var id: String
    var owner: String
    
    var body: some View {
        VStack(spacing: 25) {
            Image("clock")
                .resizable()
                .frame(width: 55, height: 55)
                .onTapGesture {
                    viewModel.isPresented.toggle()
                }
            Text(viewModel.info[0])
                .fontWeight(.bold)
                .onTapGesture {
                    viewModel.isPresented.toggle()
                }
        }.navigationTitle("Расписание")
        .onAppear {
            viewModel.getTimetable(id: id, owner: owner)
        }
        .sheet(isPresented: $viewModel.isPresented) {
            TimetableDayResultListView(id: id, date: viewModel.getCurrentDate(), owner: owner)
        }
    }
}

#Preview {
    TimetableDayInfoView(id: "", owner: "")
}
