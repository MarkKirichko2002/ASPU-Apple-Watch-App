//
//  FeaturesList.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 14.09.2024.
//

import SwiftUI

struct FeaturesList: View {
    var body: some View {
        List(AppFeatures.features, id: \.name) { feature in
            NavigationLink(destination: FeatureInfoView(feature: feature)) {
                Text("\(feature.id)) \(feature.name)")
                    .fontWeight(.bold)
            }
        }.navigationTitle("Фишки: \(AppFeatures.features.count)")
    }
}

#Preview {
    FeaturesList()
}
