//
//  ContentView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 03.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    let settingsManager = SettingsManager()
    
    var body: some View {
        VStack {
            if settingsManager.getSavedSplashScreen() != .none {
                SplashView(splashScreen: settingsManager.getSavedSplashScreen())
            } else {
                AppSectionsDisplayView()
            }
        }
    }
}

#Preview {
    ContentView()
}
