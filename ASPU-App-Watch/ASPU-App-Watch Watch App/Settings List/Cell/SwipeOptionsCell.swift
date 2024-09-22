//
//  SwipeOptionsCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 22.09.2024.
//

import SwiftUI

struct SwipeOptionsCell: View {
    
    var body: some View {
        NavigationLink {
            SwipeOptionsListView()
        } label: {
            Text("Свайпы")
                .fontWeight(.bold)
        }
    }
}

#Preview {
    SwipeOptionsCell()
}
