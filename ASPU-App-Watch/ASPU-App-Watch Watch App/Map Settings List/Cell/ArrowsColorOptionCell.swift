//
//  ArrowsColorOptionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 18.10.2024.
//

import SwiftUI

struct ArrowsColorOptionCell: View {
    
    @State var currenColor = UserDefaults.loadData(type: AppColors.self, key: "arrow color") ?? AppColors.system
    
    var body: some View {
        Picker("Цвет стрелок", selection: $currenColor) {
            ForEach(AppColors.allCases, id: \.self) {
                Text($0.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color($0.color))
            }.navigationTitle("Цвета")
        }.fontWeight(.bold)
        .onChange(of: currenColor) { color in
            UserDefaults.saveData(object: color, key: "arrow color") {}
        }
    }
}

#Preview {
    ArrowsColorOptionCell()
}
