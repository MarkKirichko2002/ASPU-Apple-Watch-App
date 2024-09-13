//
//  TodayNewsInfoViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 13.09.2024.
//

import Foundation

final class TodayNewsInfoViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var title = "Сегодня"
    
    let newsService = ASPUNewsService()
    let settingsManager = SettingsManager()
    let dateManager = DateManager()
    
    var sections = [TodayNewsSectionModel]()
    
    init() {
        getNews()
    }
    
    // новости
    func getNews() {
        
        let dispatchGroup = DispatchGroup()
        
        for category in NewsCategories.categories {
            dispatchGroup.enter()
            if category.abbreviation != "-" {
                Task {
                    let result = try await newsService.getNews(abbreviation: category.abbreviation)
                    defer { dispatchGroup.leave() }
                    switch result {
                    case .success(let data):
                        let news = checkTodayNews(news: data.articles ?? [])
                        if !news.isEmpty {
                            let model = TodayNewsSectionModel(name: category.name, abbreviation: category.abbreviation, news: news)
                            sections.append(model)
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
            } else {
                Task {
                    let result = try await newsService.getASPUNews()
                    defer { dispatchGroup.leave() }
                    switch result {
                    case .success(let data):
                        let news = checkTodayNews(news: data.articles ?? [])
                        if !news.isEmpty {
                            let model = TodayNewsSectionModel(name: "\(category.name)", abbreviation: category.abbreviation, news: news)
                            sections.append(model)
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            self.isLoading.toggle()
        }
    }
    
    func checkTodayNews(news: [Article])-> [Article] {
        let currentDate = dateManager.getCurrentDate()
        var articles = [Article]()
        for article in news {
            if article.date == currentDate {
                articles.append(article)
            }
        }
        return articles
    }
    
    func categoryItem(section: TodayNewsSectionModel)-> NewsCategoryModel {
        return NewsCategories.categories.first { $0.abbreviation == section.abbreviation } ?? NewsCategories.categories[0]
    }
}
