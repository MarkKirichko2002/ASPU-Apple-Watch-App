//
//  TimetableOptionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 17.07.2024.
//

import SwiftUI

struct TimetableOptionCell: View {
    
    var option: TimetableOptionModel
    
    var body: some View {
        HStack(spacing: 10) {
            Image(option.icon)
                .resizable()
                .frame(width: 40, height: 40)
            Text(option.name)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    TimetableOptionCell(option: TimetableOptions.options[0])
}
