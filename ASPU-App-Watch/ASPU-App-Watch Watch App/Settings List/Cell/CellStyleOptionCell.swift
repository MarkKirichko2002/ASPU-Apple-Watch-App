//
//  CellStyleOptionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 05.09.2024.
//

import SwiftUI

enum CellStyle: String, Codable, CaseIterable, Hashable {
    case carousel = "Карусель"
    case automatic = "Обычный"
}

struct CellStyleOptionCell: View {
    var body: some View {
        NavigationLink(destination: CellStyleOptionsListView()) {
            Text("Стили списка")
                .fontWeight(.bold)
        }
    }
}

#Preview {
    CellStyleOptionCell()
}
