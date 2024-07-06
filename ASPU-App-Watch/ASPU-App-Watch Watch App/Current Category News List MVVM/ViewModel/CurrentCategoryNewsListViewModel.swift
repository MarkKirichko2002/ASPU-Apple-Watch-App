//
//  CurrentCategoryNewsListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 06.07.2024.
//

import Foundation

final class CurrentCategoryNewsListViewModel: ObservableObject {
    
    @Published var isPresented = false
    
    let newsResponse = NewsDummyData.newsResponse
    
}
