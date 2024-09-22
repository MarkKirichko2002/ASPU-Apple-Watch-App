//
//  DaysListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 22.09.2024.
//

import SwiftUI

struct DaysListView: View {
    
    @ObservedObject var viewModel: DaysListViewModel
    
    var body: some View {
        List(viewModel.days, id: \.name) { day in
            Text("\(day.dayOfWeek) \(day.date) (\(day.info))")
                .fontWeight(.bold)
                .foregroundColor(viewModel.timeTableColor(day: day))
                .onTapGesture {
                    viewModel.currentDay = day
                    viewModel.isPresented.toggle()
                }
        }.navigationTitle("Выберите день")
            .sheet(isPresented: $viewModel.isPresented) {
                TimetableDayResultListView(id: viewModel.id, date: viewModel.currentDay.date, owner: viewModel.owner)
            }
        .onAppear {
            viewModel.setUpData()
        }
    }
}

//#Preview {
//    DaysListView()
//}
