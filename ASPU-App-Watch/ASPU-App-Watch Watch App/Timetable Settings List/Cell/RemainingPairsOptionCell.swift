//
//  RemainingPairsOptionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 29.12.2024.
//

import SwiftUI

struct RemainingPairsOptionCell: View {
    var body: some View {
        NavigationLink(destination: RemainingPairsOptionsListView()) {
            Text("Пары")
                .fontWeight(.bold)
        }
    }
}

#Preview {
    RemainingPairsOptionCell()
}
