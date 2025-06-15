//
//  WeeksListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 26.07.2024.
//

import SwiftUI

struct WeeksListView: View {
    
    @ObservedObject var viewModel = WeeksListViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                Text("Загрузка...")
                    .fontWeight(.bold)
            } else if !viewModel.weeks.isEmpty {
                List(viewModel.weeks) { week in
                    if viewModel.getSwipeOption() {
                        WeekCell(week: week)
                            .onTapGesture {
                                viewModel.currentWeek = week
                                viewModel.isSelected.toggle()
                            }
                            .swipeActions(edge: viewModel.getSwipeEdge().edge) {
                                Button {
                                    viewModel.currentWeek = week
                                    viewModel.isPresentedInfo.toggle()
                                } label: {
                                    Image("info")
                                }
                            }
                    } else {
                        WeekCell(week: week)
                            .onTapGesture {
                                viewModel.currentWeek = week
                                viewModel.isSelected.toggle()
                         }
                    }
                }.modifier(CustomListStyle())
            } else {
                Text("Нет недель")
                    .fontWeight(.bold)
            }
        }
        .navigationTitle("Недели")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    self.viewModel.isPresentedOptions.toggle()
                }) {
                    Image("sections")
                }.foregroundStyle(Color(UIColor.white))
            }
        }
        .onAppear() {
            if viewModel.isLoading {
                viewModel.getWeeks()
            }
        }
        .onChange(of: viewModel.isSelected) { _ in
            viewModel.isPresented.toggle()
        }
        .sheet(isPresented: $viewModel.isPresented) {
            WeekDaysListView(week: viewModel.currentWeek)
        }
        .sheet(isPresented: $viewModel.isPresentedInfo) {
            TimetableDaysInfoView(week: viewModel.currentWeek, id: viewModel.getSavedID(), owner: viewModel.getSavedOwner())
        }
        .sheet(isPresented: $viewModel.isPresentedOptions) {
            TimetableWeekOptionsListView()
        }
    }
}

#Preview {
    WeeksListView()
}
