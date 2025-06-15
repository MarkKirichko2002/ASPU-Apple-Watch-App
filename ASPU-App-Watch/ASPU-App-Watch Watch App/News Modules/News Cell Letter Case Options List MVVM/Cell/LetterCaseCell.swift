//
//  LetterCaseCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 24.05.2025.
//

import SwiftUI

struct LetterCaseCell: View {
    
    var letterCase: LetterCases
    var isSelected: Bool
    
    var body: some View {
        if isSelected {
            HStack {
                Text(letterCase.rawValue)
                    .fontWeight(.bold)
                Spacer()
                Image("check")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        } else {
            HStack {
                Text(letterCase.rawValue)
                    .fontWeight(.bold)
                Spacer()
            }.contentShape(Rectangle())
        }
    }
}

//#Preview {
//    LetterCaseCell()
//}
