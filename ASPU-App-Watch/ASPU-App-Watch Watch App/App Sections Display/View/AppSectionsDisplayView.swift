//
//  AppSectionsDisplayView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 11.11.2024.
//

import SwiftUI

struct AppSectionsDisplayView: View {
    
    let settingsManager = SettingsManager()
    @State var isChanged = false
    
    var body: some View {
        VStack {
            switch settingsManager.getSectionsDisplayOption() {
            case .list:
                AppSectionsListView()
            case .menu:
                AppSectionsMenuView()
            }
        }.onChange(of: isChanged) {}
        .onAppear {
            NotificationCenter.default.addObserver(forName: Notification.Name("sections change"), object: nil, queue: nil) { _ in
                isChanged.toggle()
            }
        }
    }
}

#Preview {
    AppSectionsDisplayView()
}
