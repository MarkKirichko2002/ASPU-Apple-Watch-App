//
//  TeacherCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 26.07.2024.
//

import SwiftUI

struct TeacherCell: View {
    
    var teacher: String
    var isSelected: Bool
    
    var body: some View {
        if isSelected {
            HStack {
                Text(teacher)
                    .fontWeight(.bold)
                Spacer()
                Image("check")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        } else {
            HStack {
                Text(teacher)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    TeacherCell(teacher: "", isSelected: false)
}
