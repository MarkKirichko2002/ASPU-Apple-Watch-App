//
//  SettingsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 04.07.2024.
//

import SwiftUI

struct SettingsListView: View {
    
    var body: some View {
        
        Form() {
            
            Section("Основое") {
                List(SettingSections.sections) { section in
                    NavigationLink {
                        switch section.id {
                        case 1:
                            NewsCategoriesListView()
                        default:
                            EmptyView()
                        }
                    } label: {
                        SettingSectionCell(section: section)
                    }
                }
            }
            
        }
        .navigationTitle("Настройки")
    }
}

#Preview {
    SettingsListView()
}
