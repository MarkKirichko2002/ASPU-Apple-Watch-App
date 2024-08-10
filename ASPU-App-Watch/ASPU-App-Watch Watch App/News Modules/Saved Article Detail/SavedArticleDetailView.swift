//
//  SavedArticleDetailView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 10.08.2024.
//

import SwiftUI
import SDWebImageSwiftUI
import SwiftData

struct SavedArticleDetailView: View {
    
    var article: ArticleModel
    
    @Query var articles: [ArticleModel]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        Form() {
            Section("Изображения") {
                ScrollView(.horizontal, showsIndicators: true) {
                    LazyHStack {
                        if !article.images.isEmpty {
                            ForEach(article.images, id: \.self) { image in
                                WebImage(url: URL(string: image))
                                    .resizable()
                                    .frame(width: 160, height: 160)
                                    .aspectRatio(contentMode: .fill)
                                    .cornerRadius(10)
                            }.listStyle(.carousel)
                        } else {
                            Text("Нет изображений")
                                .fontWeight(.bold)
                        }
                    }
                    .padding()
                }
            }
            
            Section("Название") {
                Text(article.title)
                    .fontWeight(.bold)
            }
            
            Section("Дата") {
                Text(article.date)
                    .fontWeight(.bold)
            }
            
            Section("Описание") {
                if !article.desc.isEmpty {
                    Text(article.desc)
                        .fontWeight(.bold)
                } else {
                    Text("Нет описания")
                        .fontWeight(.bold)
                }
            }
        }
        .navigationTitle("Подробнее")
    }
}

#Preview {
    SavedArticleDetailView(article: ArticleModel(id: 0, title: "", desc: "", date: "", images: []))
}
