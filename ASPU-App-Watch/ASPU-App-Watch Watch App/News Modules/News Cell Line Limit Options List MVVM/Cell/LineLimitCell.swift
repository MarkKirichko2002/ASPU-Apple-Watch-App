//
//  LineLimitCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 03.05.2025.
//

import SwiftUI

struct LineLimitCell: View {
    
    var limit: LineLimits
    var isSelected: Bool
    
    var body: some View {
        if isSelected {
            HStack {
                Text(limit.rawValue)
                    .fontWeight(.bold)
                Spacer()
                Image("check")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        } else {
            HStack {
                Text(limit.rawValue)
                    .fontWeight(.bold)
                Spacer()
            }.contentShape(Rectangle())
        }
    }
}

//#Preview {
//    LineLimitCell()
//}
