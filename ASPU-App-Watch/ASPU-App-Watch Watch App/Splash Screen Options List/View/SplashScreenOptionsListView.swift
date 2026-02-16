//
//  SplashScreenOptionsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 22.04.2025.
//

import SwiftUI

struct SplashScreenOptionsListView: View {
    
    @State var currentOption = splashScreenOptions.none
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let settingsManager = SettingsManager()
    
    var body: some View {
        List(splashScreenOptions.allCases, id: \.self) { option in
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
                    saveStyle(style: option) {
                        closeScreen()
                    }
                }
            }
        }.navigationTitle("Заставки")
            .onAppear {
                currentOption = settingsManager.getSavedSplashScreen()
            }
            .fontWeight(.bold)
    }
    
    func closeScreen() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func saveStyle(style: splashScreenOptions, completion: @escaping()->Void) {
        UserDefaults.saveData(object: style, key: "splash screen") {completion()}
    }
}

#Preview {
    SplashScreenOptionsListView()
}
