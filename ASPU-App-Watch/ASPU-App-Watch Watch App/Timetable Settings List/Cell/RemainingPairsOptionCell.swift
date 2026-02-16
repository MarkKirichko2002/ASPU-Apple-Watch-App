//
//  PairOptionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 29.12.2024.
//

import SwiftUI

struct PairOptionCell: View {
    var body: some View {
        NavigationLink(destination: PairsOptionsListView()) {
            Text("Пары")
                .fontWeight(.bold)
        }
    }
}

#Preview {
    PairOptionCell()
}
