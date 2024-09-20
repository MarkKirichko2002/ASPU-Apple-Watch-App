//
//  ContentView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 03.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    var isSplashOn = UserDefaults.standard.object(forKey: "isSplashOn") as? Bool ?? false
    
    var body: some View {
        VStack {
            if isSplashOn {
                SplashView()
            } else {
                AppSectionsListView()
            }
        }
    }
}

#Preview {
    ContentView()
}
