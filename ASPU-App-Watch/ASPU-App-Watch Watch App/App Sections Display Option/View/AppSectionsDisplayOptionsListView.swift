//
//  AppSectionsDisplayOptionsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 11.11.2024.
//

import SwiftUI

enum SectionDisplayOptions: String, Codable, CaseIterable {
    case list = "Список"
    case menu = "Навигация"
}

struct AppSectionsDisplayOptionsListView: View {
    
    @State var currentOption = SectionDisplayOptions.list
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let settingsManager = SettingsManager()
    
    var body: some View {
        List(SectionDisplayOptions.allCases, id: \.self) { option in
            if currentOption == option {
                HStack {
                    Text(option.rawValue)
                        .fontWeight(.bold)
                    Spacer()
                    Image("check")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            } else {
                HStack {
                    Text(option.rawValue)
                        .fontWeight(.bold)
                    Spacer()
                }.contentShape(Rectangle())
                .onTapGesture {
                    currentOption = option
                    saveOption(option: option) {
                        closeScreen()
                    }
                }
            }
        }.navigationTitle("Варианты")
            .onAppear {
                currentOption = settingsManager.getSectionsDisplayOption()
            }
            .fontWeight(.bold)
    }
    
    func closeScreen() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
            self.presentationMode.wrappedValue.dismiss()
        }
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { _ in
            NotificationCenter.default.post(name: Notification.Name("sections change"), object: nil)
        }
    }
    
    func saveOption(option: SectionDisplayOptions, completion: @escaping()->Void) {
        UserDefaults.saveData(object: option, key: "sections display option") {completion()}
    }
}

#Preview {
    AppSectionsDisplayOptionsListView()
}
