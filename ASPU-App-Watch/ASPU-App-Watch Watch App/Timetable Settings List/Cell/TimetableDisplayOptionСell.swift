//
//  TimetableDisplayOptionСell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 24.10.2024.
//

import SwiftUI

struct TimetableDisplayOptionСell: View {
    var body: some View {
        NavigationLink(destination: TimetableDisplayOptionsListView()) {
            Text("Экран")
                .fontWeight(.bold)
        }
    }
}

#Preview {
    TimetableDisplayOptionСell()
}
