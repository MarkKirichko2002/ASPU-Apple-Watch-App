//
//  NewsSettingsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 21.04.2025.
//

import SwiftUI

struct NewsSettingsListView: View {
    var body: some View {
        List {
            NewsCategoryOptionCell()
            NewsCellLineLimitOptionCell()
            NewsCellLetterCaseOptionCell()
            GroupByDatesOptionCell()
            ShowArticleWordsCountOptionCell()
        }.navigationTitle("Новости")
    }
}

#Preview {
    NewsSettingsListView()
}
