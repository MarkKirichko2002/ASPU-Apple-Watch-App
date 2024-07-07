//
//  CurrentCategoryNewsListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 06.07.2024.
//

import Foundation

final class CurrentCategoryNewsListViewModel: ObservableObject {
    
    @Published var newsResponse = NewsResponse(currentPage: 0, countPages: 0, articles: [])
    @Published var isPresented = false
    
    // MARK: - сервисы
    private let newsService = ASPUNewsService()
    
    func getNews(category: NewsCategoryModel) {
        Task {
            let result = try await newsService.getNews(abbreviation: category.abbreviation)
            switch result {
            case .success(let data):
                self.newsResponse = data
            case .failure(let error):
                print(error)
            }
        }
    }
}
