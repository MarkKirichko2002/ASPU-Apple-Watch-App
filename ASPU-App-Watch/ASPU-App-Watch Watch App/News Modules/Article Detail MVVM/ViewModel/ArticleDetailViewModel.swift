//
//  ArticleDetailViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 10.07.2024.
//

import Foundation

final class ArticleDetailViewModel: ObservableObject {
    
    @Published var articleInfo = ArticleInfo(id: 0, title: "", description: "", date: "", images: [])
    @Published var isLoading = true
    
    // MARK: - сервисы
    private let newsService = ASPUNewsService()
    
    func getArticleInfo(abbreviation: String, id: Int) {
        Task {
            let result = try await newsService.getArticleInfo(abbreviation: abbreviation, id: id)
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.articleInfo = data
                    self.isLoading = false
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }
    }
}
