//
//  SettingsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 04.07.2024.
//

import SwiftUI

struct SettingsListView: View {
    
    @State var alert = false
    
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
                            EmptyView()
                        }
                    } label: {
                        SettingSectionCell(section: section)
                    }
                }
            }
            
            Section("Другое") {
                ShowSplashOptionCell()
                SectionsPostionOptionCell()
                    .onTapGesture {
                        self.alert.toggle()
                }
                SwipeOptionsCell()
                CellStyleOptionCell()
            }
            
            Section("О приложении (версия: \(getAppVersion()))") {
                AppFeaturesCell()
            }
        }
        .navigationTitle("Настройки")
        .alert(isPresented: $alert) {
            Alert(
                title: Text("Сбросить порядок разделов?"),
                primaryButton: .destructive(Text("Сбросить")) {
                    NotificationCenter.default.post(name: Notification.Name("reset sections position"), object: nil)
                },
                secondaryButton: .cancel(Text("Отмена")) {
                    
                }
            )
        }
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
