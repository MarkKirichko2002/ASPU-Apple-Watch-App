//
//  NewsListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 05.07.2024.
//

import Foundation

final class NewsListViewModel: ObservableObject {
    
    @Published var newsResponse = NewsResponse(currentPage: 0, countPages: 0, articles: [])
    @Published var isPresented = false
    @Published var isLoading = true
    var currentCategory = NewsCategories.categories[0]
    
    // MARK: - сервисы
    private let newsService = ASPUNewsService()
    private let settingsManager = SettingsManager()
    
    func getNews() {
        
        let abbreviation = settingsManager.getSavedCategory()
        currentCategory = NewsCategories.categories.first(where: { $0.abbreviation == abbreviation})!
        
        self.isLoading = true
        
        if currentCategory.abbreviation != "-" {
            Task {
                let result = try await newsService.getNews(abbreviation: abbreviation)
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.isLoading = false
                        self.newsResponse = data
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.isLoading = false
                    }
                    print(error)
                }
            }
        } else {
            Task {
                let result = try await newsService.getASPUNews()
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.isLoading = false
                        self.newsResponse = data
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.isLoading = false
                    }
                    print(error)
                }
            }
        }
    }
}
