//
//  MapSettingsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 13.10.2024.
//

import SwiftUI

struct MapSettingsListView: View {
    var body: some View {
        List {
            DistanceOptionCell()
        }.navigationTitle("Карты")
    }
}

#Preview {
    MapSettingsListView()
}
