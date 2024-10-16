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
                            SavedNewsCategoriesListView()
                        case 2:
                            TimetableSettingsListView()
                        default:
                            MapSettingsListView()
                        }
                    } label: {
                        SettingSectionCell(section: section)
                    }
                }
            }
            
            Section("Другое") {
                ShowSplashOptionCell()
                SectionsOptionCell()
                SwipeOptionsCell()
                CellStyleOptionCell()
            }
            
            Section("О приложении (версия: \(getAppVersion()))") {
                AppFeaturesCell()
            }
        }
        .navigationTitle("Настройки")
    }
    
    func getAppVersion()-> String {
        var appVersion = ""
        if let currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            appVersion = currentVersion
        }
        return appVersion
    }
}

#Preview {
    SettingsListView()
}
