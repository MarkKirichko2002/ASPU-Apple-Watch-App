//
//  NewsCategoryPagesCountInfoViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 12.05.2025.
//

import Foundation

final class NewsCategoryPagesCountInfoViewModel: ObservableObject {
    
    @Published var info = "Загрузка..."
    @Published var isPresented = false
    var newsResponse = NewsResponse(currentPage: 0, countPages: 0, articles: [])
    
    // MARK: - сервисы
    let newsService = ASPUNewsService()
    
    func getNewsCategoryInfo(category: NewsCategoryModel) {
        Task {
            let result = category.abbreviation != "-" ? try await newsService.getNews(abbreviation: category.abbreviation) : try await newsService.getASPUNews()
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.info = "Всего страниц: \(data.countPages ?? 0)"
                    self.newsResponse = data
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
