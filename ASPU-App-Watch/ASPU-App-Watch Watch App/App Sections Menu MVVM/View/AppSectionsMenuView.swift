//
//  AppSectionsMenuView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 11.11.2024.
//

import SwiftUI

struct AppSectionsMenuView: View {
    
    @ObservedObject var viewModel = AppSectionsMenuViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                Image(viewModel.currentSection().icon)
                Text(viewModel.currentSection().name)
                    .fontWeight(.bold)
            }.navigationTitle("Разделы")
                .navigationBarTitleDisplayMode(.inline)
            .onTapGesture {
                viewModel.handleSection()
            }
            .navigationDestination(item: $viewModel.section) { item in
                switch item.id {
                case 1:
                    NewsDisplayView()
                case 2:
                    TimetableDisplayView()
                case 3:
                    BuildingsMapView()
                case 4:
                    SettingsListView()
                default:
                    EmptyView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        if viewModel.isFirstSection() {
                            
                        } else {
                            Button(action: {
                                viewModel.pastSection()
                            }) {
                                Image(systemName: "arrow.left")
                            }
                        }
                        
                        Spacer()
                        
                        if viewModel.isLastSection() {
                            
                        } else {
                            Button(action: {
                                viewModel.nextSection()
                            }) {
                                Image(systemName: "arrow.right")
                            }
                        }
                    }
                }
            }
        }
    }
}

//#Preview {
//    AppSectionsMenuView()
//}
