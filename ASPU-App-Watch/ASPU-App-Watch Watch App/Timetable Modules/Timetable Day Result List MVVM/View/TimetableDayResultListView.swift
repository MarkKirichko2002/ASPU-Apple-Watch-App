//
//  TimetableDayResultListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 11.07.2024.
//

import SwiftUI

struct TimetableDayResultListView: View {
    
    @ObservedObject var viewModel = TimetableDayResultListViewModel()
    @State var showOptions = false
    
    var id: String = ""
    var date: String = ""
    var owner: String = ""
    
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
        .navigationTitle(id)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    self.viewModel.isPresentedOptions.toggle()
                    print(self.viewModel.isPresentedOptions)
                }) {
                    Image("sections")
                }.foregroundStyle(Color(UIColor.white))
            }
        }
        .onAppear {
            viewModel.getTimetable(id: id, date: date, owner: owner)
        }
        .onDisappear {
            viewModel.sendNotification(id: id, owner: owner)
        }
        .onChange(of: showOptions) {
            viewModel.checkTimetableChanges()
        }
        .sheet(isPresented: $viewModel.isPresentedInfo) {
            PairInfoView(viewModel: PairInfoViewModel(pair: viewModel.currentDiscipline, pairs: viewModel.allDisciplines, date: date))
        }
        .sheet(isPresented: $viewModel.isPresentedOptions) {
            TimetableLessOptionsListView(date: viewModel.getCurrentDate(), disciplines: viewModel.timetable.disciplines, isPresented: $showOptions)
        }
    }
}

#Preview {
    TimetableDayResultListView(id: "ВМ-ИВТ-3-1", owner: "GROUP")
}
