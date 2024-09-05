//
//  TimetableDayResultListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 11.07.2024.
//

import SwiftUI

struct TimetableDayResultListView: View {
    
    @ObservedObject var viewModel = TimetableDayResultListViewModel()
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
                            viewModel.isSelected.toggle()
                        }
                }.modifier(CustomListStyle())
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    self.viewModel.isPresented.toggle()
                }) {
                    Image("sections")
                }
            }
        }
        .onAppear {
            viewModel.getTimetable(id: id, date: date, owner: owner)
        }
        .onChange(of: viewModel.isSelected) {
            viewModel.isPresentedInfo.toggle()
        }
        .sheet(isPresented: $viewModel.isPresentedInfo) {
            PairInfoView(viewModel: PairInfoViewModel(pair: viewModel.currentDiscipline, date: date))
        }
        .sheet(isPresented: $viewModel.isPresented) {
            NavigationView {
                PairFilterTypeListView(date: date, disciplines: viewModel.timetable.disciplines)
            }
        }
        .navigationTitle(id)
    }
}

#Preview {
    TimetableDayResultListView(id: "ВМ-ИВТ-2-1", owner: "GROUP")
}
