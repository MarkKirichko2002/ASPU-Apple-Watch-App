//
//  NewsCellLineLimitOptionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 03.05.2025.
//

import SwiftUI

struct NewsCellLineLimitOptionCell: View {
    var body: some View {
        NavigationLink {
            NewsCellLineLimitOptionsListView()
        } label: {
            Text("Кол-во линий")
                .fontWeight(.bold)
        }
    }
}

#Preview {
    NewsCellLineLimitOptionCell()
}
