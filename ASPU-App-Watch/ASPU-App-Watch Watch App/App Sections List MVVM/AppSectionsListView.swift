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
            List(AppSections.sections) { section in
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
                                    viewModel.toggleAlert()
                                } label: {
                                    Image("info")
                                }
                            }
                        
                    case 2:
                        AppSectionCell(section: section)
                            .swipeActions {
                                Button {
                                    viewModel.currentId = 2
                                    viewModel.toggleAlert()
                                } label: {
                                    Image("info")
                                }
                            }
                        
                    case 3:
                        AppSectionCell(section: section)
                            .swipeActions {
                                Button {
                                    viewModel.currentId = 3
                                    viewModel.toggleAlert()
                                } label: {
                                    Image("info")
                                }
                            }
                        
                    default:
                        AppSectionCell(section: section)
                    }
                }
            }
            .navigationTitle("Разделы")
            .sheet(isPresented: $viewModel.alert) {
                switch viewModel.currentId {
                case 1:
                    TodayNewsInfoView()
                case 2:
                    TimetableInfoView()
                case 3:
                    MapsInfoView()
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
