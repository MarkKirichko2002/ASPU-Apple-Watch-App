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
        HStack {
            Text(section.name)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    SettingSectionCell(section: SettingSectionModel(id: 1, name: "Новости"))
}
