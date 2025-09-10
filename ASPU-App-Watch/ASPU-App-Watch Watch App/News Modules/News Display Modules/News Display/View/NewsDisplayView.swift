//
//  NewsDisplayView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 21.06.2025.
//

import SwiftUI

struct NewsDisplayView: View {
    
    let settingsManager = SettingsManager()
    
    var body: some View {
        if settingsManager.getGroupByDatesOnOption() {
            NewsGroupDateListView(viewModel: NewsGroupDateListViewModel(page: 1, abbreviation: settingsManager.getSavedCategory()))
        } else {
            NewsListView()
        }
    }
}

#Preview {
    NewsDisplayView()
}
