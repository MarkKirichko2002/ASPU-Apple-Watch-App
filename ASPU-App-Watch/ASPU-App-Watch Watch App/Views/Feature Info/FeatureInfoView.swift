//
//  FeatureInfoView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 14.09.2024.
//

import SwiftUI

struct FeatureInfoView: View {
    
    var feature: FeatureModel
    
    var body: some View {
        Form() {
            Section("Название") {
                Text("\(feature.name) (\(feature.otherName))")
                    .fontWeight(.bold)
            }
            Section("Описание") {
                Text(feature.description)
                    .fontWeight(.bold)
            }
        }.navigationTitle("Фишка №\(feature.id)")
    }
}

//#Preview {
//    FeatureInfoView()
//}
