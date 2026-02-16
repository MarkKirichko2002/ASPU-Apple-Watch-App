//
//  AppSectionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 04.07.2024.
//

import SwiftUI

struct AppSectionCell: View {
    
    var section: AppSectionModel
    
    var body: some View {
        if section.isVisible {
            HStack(spacing: 10) {
                Image(section.icon)
                    .resizable()
                    .frame(width: 40, height: 40)
                Text(section.name)
                    .fontWeight(.bold)
            }
        } else {
            HStack(spacing: 10) {
                Image("eye")
                    .resizable()
                    .frame(width: 40, height: 40)
                Text(section.name)
                    .fontWeight(.bold)
            }.opacity(0.5)
        }
    }
}

//#Preview {
//    AppSectionCell(section: AppSectionModel(id: 1, name: "Новости", icon: "mail"))
//}
