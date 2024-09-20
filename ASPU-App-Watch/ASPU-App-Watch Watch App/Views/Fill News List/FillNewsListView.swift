//
//  FillNewsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 13.09.2024.
//

import SwiftUI

struct FillNewsListView: View {
    
    var abbreviation: String
    var articles: [Article]
    
    var body: some View {
        List(articles) { article in
            ArticleCell(article: article, abbreviation: abbreviation, isSavedArticle: false)
        }.navigationTitle("Новостей: \(articles.count)")
    }
}

//#Preview {
//    FillNewsListView()
//}
