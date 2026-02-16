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
    @State var alert = false
    
    var abbreviation: String
    
    // MARK: - сервисы
    let dateManager = DateManager()
    let settingsManager = SettingsManager()
    
    var body: some View {
        NavigationView {
            VStack {
                if !news.isEmpty {
                    List(news) { article in
                        ArticleCell(savedArticle: ArticleModel(id: article.id, title: article.title, desc: article.desc, date: article.date, images: article.images), abbreviation: abbreviation, isSavedArticle: true)
                            .swipeActions(edge: settingsManager.getSavedSwipeEdge().edge) {
                                Button {
                                    modelContext.delete(article)
                                } label: {
                                    Image(systemName: "trash")
                                }
                            }
                    }.modifier(CustomListStyle())
                } else {
                    Text("Нет новостей")
                        .fontWeight(.bold)
                }
            }
            .navigationTitle("Новости")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        alert.toggle()
                    }) {
                        Image("trash")
                    }.foregroundStyle(Color(UIColor.white))
                        
                }
            }
            .alert("Удалить новости", isPresented: $alert) {
                Button("Прошлые даты", role: .destructive) {
                    deleteDate()
                }
                Button("Все", role: .destructive) {
                    deleteAll()
                }
                Button("Отмена", role: .cancel) {
                    
                }
            }
        }
    }
    
    func deleteAll() {
        for article in news {
            modelContext.delete(article)
        }
    }
    
    func deleteDate() {
        for article in news {
            let date = dateManager.getCurrentDate()
            if article.date != date {
                modelContext.delete(article)
            }
        }
    }
}

#Preview {
    SavedNewsListView(abbreviation: "")
}
