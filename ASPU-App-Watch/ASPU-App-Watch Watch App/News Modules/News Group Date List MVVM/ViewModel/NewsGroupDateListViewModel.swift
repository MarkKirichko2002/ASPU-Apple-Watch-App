//
//  NewsGroupDateListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 21.06.2025.
//

import Foundation

final class NewsGroupDateListViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var isPresented = false
    
    var page: Int
    var abbreviation: String
    
    let newsService = ASPUNewsService()
    let settingsManager = SettingsManager()
    let dateManager = DateManager()
    
    var sections = [NewsDateSectionModel]()
    var currentCategory = NewsCategories.categories[0]
    
    init(page: Int, abbreviation: String) {
        self.page = page
        self.abbreviation = abbreviation
        observeCategory()
    }
    
    func getNews() {
        currentCategory = NewsCategories.categories.first(where: { $0.abbreviation == abbreviation})!
        settingsManager.saveCategory(abbreviation: currentCategory.abbreviation)
        sections = []
        Task {
            let result = try await newsService.getNews(by: page, abbreviation: abbreviation)
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.groupNewsByDate(articles: data.articles ?? [])
                    self.isLoading = false
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                print(error)
            }
        }
    }
    
    func groupNewsByDate(articles: [Article]) {
        for article in articles {
            let model = NewsDateSectionModel(date: article.date ?? "", abbreviation: currentCategory.abbreviation, news: articles.filter({ $0.date == article.date }))
            if !sections.contains(where: { $0.date == model.date }) {
                sections.append(model)
            }
        }
    }
    
    func observeCategory() {
        NotificationCenter.default.addObserver(forName: Notification.Name("category"), object: nil, queue: nil) { notification in
            if let category = notification.object as? NewsCategoryModel {
                if self.currentCategory.id != category.id {
                    self.abbreviation = category.abbreviation
                    self.getNews()
                }
            }
        }
    }
}
