//
//  SettingsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 04.07.2024.
//

import SwiftUI

struct SettingsListView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Form() {
            Section("Основое") {
                List(SettingSections.sections) { section in
                    NavigationLink {
                        switch section.id {
                        case 1:
                            NewsSettingsListView()
                        case 2:
                            TimetableSettingsListView()
                        case 3:
                            MapSettingsListView()
                        case 4:
                            AppSectionsOptionsListView()
                        default:
                            EmptyView()
                        }
                    } label: {
                        SettingSectionCell(section: section)
                    }
                }
            }
            
            Section("Другое") {
                SplashScreenOptionCell()
                SwipeOptionsCell()
                CellStyleOptionCell()
            }
            
            Section("О приложении (версия: \(getAppVersion()))") {
                AppFeaturesCell()
            }
        }.navigationTitle("Настройки")
    }
    
    func getAppVersion()-> String {
        var appVersion = ""
        if let currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            appVersion = currentVersion
        }
        return appVersion
    }
}

//#Preview {
//    SettingsListView()
//}
