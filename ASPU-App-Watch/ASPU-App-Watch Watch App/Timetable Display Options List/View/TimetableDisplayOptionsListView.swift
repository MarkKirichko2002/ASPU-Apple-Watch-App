//
//  TimetableDisplayOptionsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 29.10.2024.
//

import SwiftUI

struct TimetableDisplayOptionsListView: View {
    
    @State var currentOption = TimetableDisplayOptions.day
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let settingsManager = SettingsManager()
    
    var body: some View {
        List(TimetableDisplayOptions.allCases, id: \.self) { option in
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
                currentOption = settingsManager.getTimetableDisplayOption()
            }
            .fontWeight(.bold)
    }
    
    func closeScreen() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func saveOption(option: TimetableDisplayOptions, completion: @escaping()->Void) {
        UserDefaults.saveData(object: option, key: "timetable display option") {completion()}
    }
}

#Preview {
    TimetableDisplayOptionsListView()
}
