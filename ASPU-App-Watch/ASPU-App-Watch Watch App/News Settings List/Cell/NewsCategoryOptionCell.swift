//
//  NewsCategoryOptionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 21.04.2025.
//

import SwiftUI

struct NewsCategoryOptionCell: View {
    var body: some View {
        NavigationLink {
            SavedNewsCategoriesListView()
        } label: {
            Text("Категория")
                .fontWeight(.bold)
        }
    }
}

#Preview {
    NewsCategoryOptionCell()
}
