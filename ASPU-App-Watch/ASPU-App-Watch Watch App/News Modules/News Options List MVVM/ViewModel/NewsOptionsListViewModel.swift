//
//  NewsOptionsListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 06.07.2024.
//

import Foundation

final class NewsOptionsListViewModel: ObservableObject {
    
    @Published var options = NewsOptions.options
    @Published var isPresented = false
    var newsResponse = NewsResponse(currentPage: 0, countPages: 0, articles: [])
    var currentCategory = NewsCategories.categories[0]
    var currentId = 1
    
    // MARK: - сервисы
    private let newsService = ASPUNewsService()
    private let settingsManager = SettingsManager()
    
    func getData() {
        let abbreviation = settingsManager.getSavedCategory()
        guard let category = NewsCategories.categories.first(where: { $0.abbreviation ==  abbreviation}) else {return}
        self.currentCategory = category
        getPagesCount(category: category)
    }
    
    func getPagesCount(category: NewsCategoryModel) {
        if category.abbreviation != "-" {
            Task {
                let result = try await newsService.getNews(abbreviation: category.abbreviation)
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.newsResponse = data
                        self.options[0].name = "Категория: \(category.name)"
                        self.options[1].name = "Страниц: \(data.countPages ?? 0)"
                    }
                case .failure(let error):
                    print(error)
                }
            }
        } else {
            Task {
                let result = try await newsService.getASPUNews()
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.newsResponse = data
                        self.options[0].name = "Категория: \(category.name)"
                        self.options[1].name = "Страниц: \(data.countPages ?? 0)"
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
