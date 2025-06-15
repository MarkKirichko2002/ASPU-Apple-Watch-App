//
//  SwipeEdgeOptionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 04.05.2025.
//

import SwiftUI

struct SwipeEdgeOptionCell: View {
    var body: some View {
        NavigationLink {
            SwipeEdgeOptionsListView()
        } label: {
            Text("Край")
                .fontWeight(.bold)
        }
    }
}

#Preview {
    SwipeEdgeOptionCell()
}
