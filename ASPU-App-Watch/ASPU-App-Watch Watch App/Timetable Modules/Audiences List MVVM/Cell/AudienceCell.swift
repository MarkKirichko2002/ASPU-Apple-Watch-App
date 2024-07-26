//
//  AudienceCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 26.07.2024.
//

import SwiftUI

struct AudienceCell: View {
    
    var audience: String
    var isSelected: Bool
    
    var body: some View {
        if isSelected {
            HStack {
                Text(audience)
                    .fontWeight(.bold)
                Spacer()
                Image("check")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        } else {
            HStack {
                Text(audience)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    AudienceCell(audience: "", isSelected: false)
}
