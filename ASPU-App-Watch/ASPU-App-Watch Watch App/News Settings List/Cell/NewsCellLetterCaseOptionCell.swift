//
//  NewsCellLetterCaseOptionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 24.05.2025.
//

import SwiftUI

struct NewsCellLetterCaseOptionCell: View {
    var body: some View {
        NavigationLink {
            NewsCellLetterCaseOptionsListView()
        } label: {
            Text("Регистр букв")
                .fontWeight(.bold)
        }
    }
}

#Preview {
    NewsCellLetterCaseOptionCell()
}
