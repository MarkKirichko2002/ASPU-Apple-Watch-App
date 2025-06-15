//
//  SwipeEdgeCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 04.05.2025.
//

import SwiftUI

struct SwipeEdgeCell: View {
    
    var edge: swipeEdges
    var isSelected: Bool
    
    var body: some View {
        if isSelected {
            HStack {
                Text(edge.rawValue)
                    .fontWeight(.bold)
                Spacer()
                Image("check")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        } else {
            HStack {
                Text(edge.rawValue)
                    .fontWeight(.bold)
                Spacer()
            }.contentShape(Rectangle())
        }
    }
}

//#Preview {
//    SwipeEdgeCell()
//}
