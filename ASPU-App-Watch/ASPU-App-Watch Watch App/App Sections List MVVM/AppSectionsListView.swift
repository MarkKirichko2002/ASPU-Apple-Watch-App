//
//  AppSectionsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 03.07.2024.
//

import SwiftUI

struct AppSectionsListView: View {
    
    @ObservedObject var viewModel = AppSectionsListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.sections) { section in
                NavigationLink {
                    switch section.id {
                    case 1:
                        NewsListView()
                    case 2:
                        TimetableDayListView()
                    case 3:
                        BuildingsMapView()
                    case 4:
                        SettingsListView()
                    default:
                        EmptyView()
                    }
                } label: {
                    if viewModel.checkSwipeOption() {
                        AppSectionCell(section: section)
                            .swipeActions(edge: .trailing) {
                                Button {
                                    if viewModel.checkSwipeFromLeft() == .info {
                                        viewModel.showInfo(id: section.id)
                                    } else {
                                        viewModel.makeImportantSection(index: section.id - 1)
                                    }
                                } label: {
                                    Image(viewModel.checkSwipeFromLeft() == .info ? "info" : "up")
                                }
                            }
                        
                            .swipeActions(edge: .leading) {
                                Button {
                                    if viewModel.checkSwipeFromRight() == .up {
                                        viewModel.makeImportantSection(index: section.id - 1)
                                    } else {
                                        viewModel.showInfo(id: section.id)
                                    }
                                } label: {
                                    Image(viewModel.checkSwipeFromRight() == .up ? "up" : "info")
                                }
                            }
                    } else {
                        AppSectionCell(section: section)
                    }
                }
            }
            .navigationTitle("Разделы")
            .onAppear {
                viewModel.isChanged.toggle()
            }
            .onChange(of: viewModel.isChanged) {}
            .sheet(isPresented: $viewModel.info) {
                switch viewModel.currentId {
                case 1:
                    TodayNewsInfoView()
                case 2:
                    TimetableInfoView()
                case 3:
                    MapsInfoView()
                case 4:
                    AppVersionInfoView()
                default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    AppSectionsListView()
}
