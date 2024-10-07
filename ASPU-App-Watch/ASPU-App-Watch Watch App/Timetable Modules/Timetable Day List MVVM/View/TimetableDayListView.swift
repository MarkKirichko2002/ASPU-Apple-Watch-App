//
//  TimetableDayListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 05.07.2024.
//

import SwiftUI

struct TimetableDayListView: View {
    
    @ObservedObject var viewModel = TimetableDayListViewModel()
    @State var showOptions = false
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                Text("Загрузка...")
                    .fontWeight(.bold)
            } else if viewModel.timetable.disciplines.isEmpty {
                Text("Нет пар")
                    .fontWeight(.bold)
            } else {
                List(viewModel.timetable.disciplines, id: \.self) { pair in
                    PairCell(discipline: pair)
                        .onTapGesture {
                            viewModel.currentDiscipline = pair
                            viewModel.isPresentedInfo.toggle()
                        }
                }.modifier(CustomListStyle())
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    viewModel.isPresented.toggle()
                }) {
                    Image("sections")
                }
            }
        }
        .onAppear {
            if viewModel.isLoading {
                viewModel.getTimetable()
            }
        }
        .onChange(of: showOptions) { 
            viewModel.checkTimetableChanges()
        }
        .sheet(isPresented: $viewModel.isPresentedInfo) {
            PairInfoView(viewModel: PairInfoViewModel(pair: viewModel.currentDiscipline, date: viewModel.timetable.date ?? viewModel.getCurrentDate()))
        }
        .sheet(isPresented: $viewModel.isPresented) {
            TimetableOptionsListView(date: viewModel.getCurrentDate(), disciplines: viewModel.timetable.disciplines, isPresented: $showOptions)
        }
        .navigationTitle(viewModel.getCurrentDate())
    }
}

#Preview {
    TimetableDayListView()
}
