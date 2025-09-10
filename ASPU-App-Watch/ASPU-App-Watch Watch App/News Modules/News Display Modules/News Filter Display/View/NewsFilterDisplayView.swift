//
//  NewsFilterDisplayView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 22.06.2025.
//

import SwiftUI

struct NewsFilterDisplayView: View {
    
    let settingsManager = SettingsManager()
    
    var news: [Article]
    var abbreviation: String
    
    var body: some View {
        VStack {
            if settingsManager.getGroupByDatesOnOption() {
                NewsGroupDateFilterListView(articles: news, abbreviation: abbreviation)
            } else {
                NewsFilterOptionView(articles: news, abbreviation: abbreviation)
            }
        }
    }
}

//#Preview {
//    NewsFilterDisplayView()
//}
