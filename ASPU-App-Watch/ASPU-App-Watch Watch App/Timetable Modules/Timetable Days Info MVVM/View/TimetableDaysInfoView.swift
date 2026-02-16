//
//  TimetableDaysInfoView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 26.10.2024.
//

import SwiftUI

struct TimetableDaysInfoView: View {
    
    @ObservedObject var viewModel = TimetableDaysInfoViewModel()
    var week: WeekModel
    var id: String
    var owner: String
    
    var body: some View {
        VStack(spacing: 25) {
            Image("clock")
                .resizable()
                .frame(width: 55, height: 55)
            if viewModel.isLoading {
                Text("Загрузка...")
                    .fontWeight(.bold)
            } else if viewModel.days.isEmpty {
                Text("Нет дней")
                    .fontWeight(.bold)
            } else {
                Text("Всего дней: \(viewModel.days.count)")
                    .fontWeight(.bold)
            }
        }.navigationTitle("Неделя: \(week.id)")
        .onTapGesture {
            viewModel.isPresented.toggle()
        }
        .onAppear {
            viewModel.getDays(week: week, id: id, owner: owner)
        }
        .sheet(isPresented: $viewModel.isPresented) {
            WeekDaysListView(week: week)
        }
    }
}

//#Preview {
//    TimetableDaysInfoView()
//}
