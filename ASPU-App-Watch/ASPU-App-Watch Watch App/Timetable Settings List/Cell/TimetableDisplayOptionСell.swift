//
//  TimetableDisplayOptionСell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 24.10.2024.
//

import SwiftUI

struct TimetableDisplayOptionСell: View {
    
    @State var currentOption = UserDefaults.loadData(type: TimetableDisplayOptions.self, key: "timetable display option") ?? TimetableDisplayOptions.day
    
    var body: some View {
        Picker("Показ расписания", selection: $currentOption) {
            ForEach(TimetableDisplayOptions.allCases, id: \.self) {
                Text($0.rawValue)
                    .fontWeight(.bold)
            }.navigationTitle("Варианты")
        }.fontWeight(.bold)
        .onChange(of: currentOption) { option in
            UserDefaults.saveData(object: option, key: "timetable display option") {}
        }
    }
}

#Preview {
    TimetableDisplayOptionСell()
}
