//
//  SavedNewsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 10.08.2024.
//

import SwiftUI
import SwiftData

struct SavedNewsListView: View {
    
    @Query var news: [ArticleModel]
    @Environment(\.modelContext) var modelContext
    
    var abbreviation: String
    
    var body: some View {
        NavigationView {
            VStack {
                if !news.isEmpty {
                    List(news) { article in
                        ArticleCell(savedArticle: ArticleModel(id: article.id, title: article.title, desc: article.desc, date: article.date, images: article.images), abbreviation: abbreviation, isSavedArticle: true)
                            .swipeActions(content: {
                                Button {
                                    modelContext.delete(article)
                                } label: {
                                    Image(systemName: "trash")
                              }
                         })
                    }
                } else {
                    Text("Нет новостей")
                        .fontWeight(.bold)
                }
            }
            .navigationTitle("Новости")
        }
    }
}

#Preview {
    SavedNewsListView(abbreviation: "")
}
