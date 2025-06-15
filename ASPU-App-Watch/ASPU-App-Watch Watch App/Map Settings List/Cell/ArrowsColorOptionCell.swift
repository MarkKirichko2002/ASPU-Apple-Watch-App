//
//  ArrowsColorOptionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 18.10.2024.
//

import SwiftUI

struct ArrowsColorOptionCell: View {
    
    let settingsManager = SettingsManager()
    @State var isChanged = false
    
    var body: some View {
        NavigationLink(destination: ArrowColorOptionsListView(isChanged: $isChanged)) {
            Text("Цвет стрелок")
                .fontWeight(.bold)
                .foregroundStyle(Color(settingsManager.getArrowsColor().color))
        }.onChange(of: isChanged) {}
    }
}

#Preview {
    ArrowsColorOptionCell()
}
