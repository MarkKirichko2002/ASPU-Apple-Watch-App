//
//  NewsInfoViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 03.11.2024.
//

import Foundation

final class NewsInfoViewModel: ObservableObject {
    
    @Published var info = ArticleInfo(id: 0, title: "", description: "", date: "", images: [])
    @Published var isLoading = true
    @Published var currentImage = ""
    @Published var isImageSelected = false
    @Published var isImagePresented = false
    
    // MARK: - сервисы
    private let newsService = ASPUNewsService()
    
    func getArticleInfo(abbreviation: String, id: Int) {
        Task {
            let result = try await newsService.getArticleInfo(abbreviation: abbreviation, id: id)
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.info = data
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
