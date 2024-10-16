//
//  SectionsOptionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 02.10.2024.
//

import SwiftUI

struct SectionsOptionCell: View {
    var body: some View {
        NavigationLink {
            SectionOptionsListView()
        } label: {
            Text("Разделы")
                .fontWeight(.bold)
        }
    }
}

#Preview {
    SectionsOptionCell()
}
