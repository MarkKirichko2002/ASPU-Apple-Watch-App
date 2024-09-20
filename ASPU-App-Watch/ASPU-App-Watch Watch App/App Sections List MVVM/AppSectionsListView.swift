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
                    switch section.id {
                    case 1:
                        AppSectionCell(section: section)
                            .swipeActions {
                                Button {
                                    viewModel.currentId = 1
                                    viewModel.toggleInfo()
                                } label: {
                                    Image("info")
                                }
                            }
                        
                            .swipeActions(edge: .leading) {
                                Button {
                                    viewModel.makeImportantSection(index: 0)
                                } label: {
                                    Image("up")
                                }
                            }
                        
                    case 2:
                        AppSectionCell(section: section)
                            .swipeActions {
                                Button {
                                    viewModel.currentId = 2
                                    viewModel.toggleInfo()
                                } label: {
                                    Image("info")
                                }
                            }
                        
                            .swipeActions(edge: .leading) {
                                Button {
                                    viewModel.makeImportantSection(index: 1)
                                } label: {
                                    Image("up")
                                }
                            }
                        
                    case 3:
                        AppSectionCell(section: section)
                            .swipeActions {
                                Button {
                                    viewModel.currentId = 3
                                    viewModel.toggleInfo()
                                } label: {
                                    Image("info")
                                }
                            }
                        
                            .swipeActions(edge: .leading) {
                                Button {
                                    viewModel.makeImportantSection(index: 2)
                                } label: {
                                    Image("up")
                                }
                            }
                        
                    case 4:
                        AppSectionCell(section: section)
                            .swipeActions {
                                Button {
                                    viewModel.currentId = 4
                                    viewModel.toggleInfo()
                                } label: {
                                    Image("info")
                                }
                            }
                        
                            .swipeActions(edge: .leading) {
                                Button {
                                    viewModel.makeImportantSection(index: 3)
                                } label: {
                                    Image("up")
                                }
                            }
                        
                    default:
                        AppSectionCell(section: section)
                    }
                }
            }
            .navigationTitle("Разделы")
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
