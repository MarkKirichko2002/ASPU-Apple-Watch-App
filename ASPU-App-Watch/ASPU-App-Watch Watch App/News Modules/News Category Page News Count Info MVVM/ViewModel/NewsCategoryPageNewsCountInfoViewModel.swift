//
//  NewsCategoryPageNewsCountInfoViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 22.05.2025.
//

import Foundation

final class NewsCategoryPageNewsCountInfoViewModel: ObservableObject {
    
    @Published var info = "Загрузка..."
    @Published var isPresented = false
    
    // MARK: - сервисы
    let newsService = ASPUNewsService()
    
    func getNewsCategoryPageInfo(page: Int, abbreviation: String) {
        Task {
            let result = try await newsService.getNews(by: page, abbreviation: abbreviation)
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.info = "Всего новостей: \(data.articles?.count ?? 0)"
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

