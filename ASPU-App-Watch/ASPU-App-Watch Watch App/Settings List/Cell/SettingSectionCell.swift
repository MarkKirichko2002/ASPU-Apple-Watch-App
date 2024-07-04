//
//  SettingSectionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 04.07.2024.
//

import SwiftUI

struct SettingSectionCell: View {
    
    var section: SettingSectionModel
    
    var body: some View {
        HStack(spacing: 10) {
            Image(section.icon)
                .resizable()
                .frame(width: 40, height: 40)
            Text(section.name)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    SettingSectionCell(section: SettingSectionModel(id: 1, name: "Новости", icon: "mail"))
}
