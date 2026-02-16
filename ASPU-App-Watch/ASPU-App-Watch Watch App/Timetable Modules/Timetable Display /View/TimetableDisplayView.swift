//
//  TimetableDisplayView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 24.10.2024.
//

import SwiftUI

struct TimetableDisplayView: View {
    
    let settingsManager = SettingsManager()
    
    var body: some View {
        switch settingsManager.getTimetableDisplayOption() {
        case .day:
            TimetableDayListView()
        case .week:
            WeeksListView()
        }
    }
}

#Preview {
    TimetableDisplayView()
}
