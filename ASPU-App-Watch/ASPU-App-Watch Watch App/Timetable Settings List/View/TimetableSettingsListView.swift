//
//  TimetableSettingsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 27.09.2024.
//

import SwiftUI

struct TimetableSettingsListView: View {
    var body: some View {
        List {
            ShowRemainingPairsCell()
        }.navigationTitle("Расписание")
    }
}

#Preview {
    TimetableSettingsListView()
}
