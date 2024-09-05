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
    
    @State var currentStyle = UserDefaults.loadData(type: CellStyle.self, key: "list style") ?? CellStyle.carousel
    
    var body: some View {
        Picker("Стиль списка", selection: $currentStyle) {
            ForEach(CellStyle.allCases, id: \.self) {
                Text($0.rawValue)
            }
        }.onChange(of: currentStyle) { style in
            UserDefaults.saveData(object: style, key: "list style") {}
        }
    }
}

#Preview {
    CellStyleOptionCell()
}
