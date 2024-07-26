//
//  WeekCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 26.07.2024.
//

import SwiftUI

struct WeekCell: View {
    
    var week: WeekModel
    
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 15) {
                Text("\(week.id)")
                    .multilineTextAlignment(.center)
                Text("c \(week.from) по \(week.to)")
                    .multilineTextAlignment(.center)
            }
            Spacer()
        }
    }
}

#Preview {
    WeekCell(week: WeekModel(id: 1, from: "", to: "", dayNames: ["" : ""]))
}
