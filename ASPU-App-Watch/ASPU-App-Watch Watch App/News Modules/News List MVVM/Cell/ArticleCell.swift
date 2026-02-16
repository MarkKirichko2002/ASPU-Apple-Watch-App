//
//  ArticleCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 05.07.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ArticleCell: View {
    
    var article = Article(id: 0, title: "", description: "", date: "", previewImage: "")
    var savedArticle = ArticleModel(id: 0, title: "", desc: "", date: "", images: [])
    var abbreviation: String
    var isSavedArticle: Bool
    
    // MARK: - сервисы
    let settingsManager = SettingsManager()
    let newsService = ASPUNewsService()
    
    @State var isPresented = false
    @State var isLoading = true
    @State var wordCount = -1
    
    var body: some View {
        NavigationLink {
            if isSavedArticle {
                SavedArticleDetailView(article: savedArticle)
            } else {
                ArticleDetailView(article: article, abbreviation: abbreviation)
            }
        } label: {
            VStack {
                if isSavedArticle {
                    if settingsManager.getSwipeOnOption() {
                        HStack {
                            VStack(alignment: .leading, spacing: 10) {
                                Text(configureLetterCase(text: savedArticle.title))
                                    .fontWeight(.black)
                                    .lineLimit(settingsManager.getSavedLineLimit().numberOfLines)
                                if settingsManager.getShowArticleWordsCount() {
                                    Text(configureWordCount())
                                        .fontWeight(.black)
                                }
                                Text(savedArticle.date)
                                    .fontWeight(.medium)
                            }
                        }.swipeActions(edge: settingsManager.getSavedSwipeEdge().edge) {
                            Button {
                                isPresented.toggle()
                            } label: {
                                Image("sections")
                            }
                        }
                    } else {
                        HStack {
                            VStack(alignment: .leading, spacing: 10) {
                                Text(configureLetterCase(text: savedArticle.title))
                                    .fontWeight(.black)
                                    .lineLimit(settingsManager.getSavedLineLimit().numberOfLines)
                                if settingsManager.getShowArticleWordsCount() {
                                    Text(configureWordCount())
                                        .fontWeight(.black)
                                }
                                Text(savedArticle.date)
                                    .fontWeight(.medium)
                            }
                        }
                    }
                } else {
                    if settingsManager.getSwipeOnOption() {
                        HStack {
                            VStack(alignment: .leading, spacing: 10) {
                                Text(configureLetterCase(text: article.title ?? "Нет заголовка"))
                                    .fontWeight(.black)
                                    .lineLimit(settingsManager.getSavedLineLimit().numberOfLines)
                                if settingsManager.getShowArticleWordsCount() {
                                    Text(configureWordCount())
                                        .fontWeight(.black)
                                }
                                Text(article.date ?? "Нет даты")
                                    .fontWeight(.medium)
                            }
                        }.swipeActions(edge: settingsManager.getSavedSwipeEdge().edge) {
                            Button {
                                isPresented.toggle()
                            } label: {
                                Image("sections")
                            }
                        }
                    } else {
                        HStack {
                            VStack(alignment: .leading, spacing: 10) {
                                Text(configureLetterCase(text: article.title ?? "Нет заголовка"))
                                    .fontWeight(.black)
                                    .lineLimit(settingsManager.getSavedLineLimit().numberOfLines)
                                if settingsManager.getShowArticleWordsCount() {
                                    Text(configureWordCount())
                                        .fontWeight(.black)
                                }
                                Text(article.date ?? "Нет даты")
                                    .fontWeight(.medium)
                            }
                        }
                    }
                }
            }.onAppear {
                if isLoading && settingsManager.getShowArticleWordsCount() {
                    getArticleInfo()
                }
            }
            .sheet(isPresented: $isPresented) {
                if isSavedArticle {
                    NewsInfoOptionsListView(abbreviation: abbreviation, id: savedArticle.id)
                } else {
                    NewsInfoOptionsListView(abbreviation: abbreviation, id: article.id)
                }
            }
        }
    }
    
    func getArticleInfo() {
        if isSavedArticle {
            loadingInfoForSavedArticle()
        } else {
            loadingInfoForArticle()
        }
    }
    
    func loadingInfoForSavedArticle() {
        Task {
            let result = try await newsService.getArticleInfo(abbreviation: abbreviation, id: savedArticle.id)
            switch result {
            case .success(let data):
                let words = data.description.components(separatedBy: " ").filter { !$0.isEmpty }
                self.wordCount = words.count
                isLoading = false
            case .failure(let error):
                print(error)
                isLoading = false
            }
        }
    }
    
    func loadingInfoForArticle() {
        Task {
            let result = try await newsService.getArticleInfo(abbreviation: abbreviation, id: article.id)
            switch result {
            case .success(let data):
                let words = data.description.components(separatedBy: " ").filter { !$0.isEmpty }
                self.wordCount = words.count
                isLoading = false
            case .failure(let error):
                print(error)
                isLoading = false
            }
        }
    }
    
    func configureWordCount()-> String {
        if wordCount <= 100 && wordCount > 0 {
            return "Мало слов (≈\(wordCount))"
        } else if wordCount > 100 {
            return "Много слов (≈\(wordCount))"
        } else if wordCount == 0 {
            return "Нет текста"
        }
        return "Подсчет слов..."
    }
    
    func configureLetterCase(text: String)-> String {
        switch settingsManager.getSavedLetterCase() {
        case .upperCase:
            return text.uppercased()
        case .lowerCase:
            return text.lowercased()
        case .mixed:
            return text.mixedcased()
        }
    }
}
