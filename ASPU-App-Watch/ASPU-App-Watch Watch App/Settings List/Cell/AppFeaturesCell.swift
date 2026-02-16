//
//  AppFeaturesCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 14.09.2024.
//

import SwiftUI

struct AppFeaturesCell: View {
    var body: some View {
        NavigationLink(destination: FeaturesList()) {
            Text("Фишки")
                .fontWeight(.bold)
        }
    }
}

#Preview {
    AppFeaturesCell()
}
