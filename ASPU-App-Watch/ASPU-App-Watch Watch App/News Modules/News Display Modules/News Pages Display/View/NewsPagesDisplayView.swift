//
//  NewsPagesDisplayView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 21.06.2025.
//

import SwiftUI

struct NewsPagesDisplayView: View {
    
    var page: Int
    var abbreviation: String
    
    let settingsManager = SettingsManager()
    
    var body: some View {
        if settingsManager.getGroupByDatesOnOption() {
            NewsGroupDateListView(viewModel: NewsGroupDateListViewModel(page: page, abbreviation: abbreviation))
        } else {
            CurrentPageNewsListView(page: page, abbreviation: abbreviation)
        }
    }
}

//#Preview {
//    NewsPagesDisplayView()
//}
