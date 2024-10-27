//
//  NewsFilterOptionViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 18.10.2024.
//

import Foundation

final class NewsFilterOptionViewModel: ObservableObject {
    
    @Published var articles = [Article]()
    
    func setUpData(articles: [Article]) {
        self.articles = []
        self.articles = articles
    }
}
