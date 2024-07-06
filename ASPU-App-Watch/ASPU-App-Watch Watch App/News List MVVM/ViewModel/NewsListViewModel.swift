//
//  NewsListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 05.07.2024.
//

import Foundation

class NewsListViewModel: ObservableObject {
    
    @Published var isPresented = false
    
    let newsResponse = NewsDummyData.newsResponse
    
}
