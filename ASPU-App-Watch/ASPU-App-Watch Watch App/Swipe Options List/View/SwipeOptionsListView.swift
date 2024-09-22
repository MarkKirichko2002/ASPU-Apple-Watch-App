//
//  SwipeOptionsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 22.09.2024.
//

import SwiftUI

struct SwipeOptionsListView: View {
    var body: some View {
        List {
            SwipeOptionCell()
        }.navigationTitle("Свайпы")
    }
}

#Preview {
    SwipeOptionsListView()
}
