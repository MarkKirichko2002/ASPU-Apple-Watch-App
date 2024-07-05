//
//  AppSectionsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 03.07.2024.
//

import SwiftUI

struct AppSectionsListView: View {
    
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
                        SettingsListView()
                    default:
                        EmptyView()
                    }
                } label: {
                    AppSectionCell(section: section)
                }
            }
            .navigationTitle("Разделы")
        }
    }
}

#Preview {
    AppSectionsListView()
}
