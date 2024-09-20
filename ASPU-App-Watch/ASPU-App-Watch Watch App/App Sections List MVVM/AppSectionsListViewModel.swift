//
//  AppSectionsListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 11.09.2024.
//

import Foundation

final class AppSectionsListViewModel: ObservableObject {
    
    @Published var alert = false
    var currentId = 1
    
    func toggleAlert() {
        DispatchQueue.main.async {
            self.alert = true
        }
    }
}
