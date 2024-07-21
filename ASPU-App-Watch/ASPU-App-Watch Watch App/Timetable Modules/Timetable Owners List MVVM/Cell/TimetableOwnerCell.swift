//
//  TimetableOwnerCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 17.07.2024.
//

import SwiftUI

struct TimetableOwnerCell: View {
    
    var owner: TimetableOwnerModel
    
    var body: some View {
        HStack(spacing: 10) {
            Image(owner.icon)
                .resizable()
                .frame(width: 40, height: 40)
            Text(owner.name)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    TimetableOwnerCell(owner: TimetableOwners.owners[0])
}
