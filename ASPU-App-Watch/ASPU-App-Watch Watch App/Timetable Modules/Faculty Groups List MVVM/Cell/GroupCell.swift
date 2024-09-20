//
//  GroupCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 26.07.2024.
//

import SwiftUI

struct GroupCell: View {
    
    var group: String
    var isSelected: Bool
    
    var body: some View {
        if isSelected {
            HStack {
                Text(group)
                    .fontWeight(.bold)
                Spacer()
                Image("check")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        } else {
            HStack {
                Text(group)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    GroupCell(group: "", isSelected: false)
}
