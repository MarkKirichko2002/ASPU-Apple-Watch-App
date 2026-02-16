//
//  NewsCategoryDisplayView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 21.06.2025.
//

import SwiftUI

struct NewsCategoryDisplayView: View {
    
    var category: NewsCategoryModel
    
    let settingsManager = SettingsManager()
    
    var body: some View {
        VStack {
            if settingsManager.getGroupByDatesOnOption() {
                NewsGroupDateListView(viewModel: NewsGroupDateListViewModel(page: 1, abbreviation: category.abbreviation))
            } else {
                CurrentCategoryNewsListView(category: category)
            }
        }.onDisappear {
            NotificationCenter.default.post(name: Notification.Name("category"), object: category)
        }
    }
}

//#Preview {
//    NewsCategoryDisplayView()
//}
