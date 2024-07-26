//
//  WeekDaysListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 26.07.2024.
//

import SwiftUI

struct WeekDayModel: Identifiable {
    let id = UUID()
    let name: String
    let date: String
}

struct WeekDaysListView: View {
    
    @ObservedObject var viewModel = WeekDaysListViewModel()
    var week: WeekModel
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                Text("Загрузка...")
            } else if viewModel.days.isEmpty {
                Text("Нет дней")
            } else {
                List(viewModel.days) { day in
                    Text("\(day.name) \(day.date)")
                        .fontWeight(.bold)
                        .onTapGesture {
                            viewModel.currentDay = day
                            viewModel.isSelected.toggle()
                     }
                }
            }
        }
        .navigationTitle("Неделя: \(week.id)")
        .onAppear {
            viewModel.getTimetable(week: week)
        }
        .onChange(of: viewModel.isSelected) {
            viewModel.isPresented.toggle()
        }
        .sheet(isPresented: $viewModel.isPresented, content: {
            TimetableDayResultListView(id: viewModel.getSavedId(), date: viewModel.currentDay.date, owner: viewModel.getSavedOwner())
        })
    }
}

#Preview {
    WeekDaysListView(week: WeekModel(id: 1, from: "", to: "", dayNames: ["" : ""]))
}
