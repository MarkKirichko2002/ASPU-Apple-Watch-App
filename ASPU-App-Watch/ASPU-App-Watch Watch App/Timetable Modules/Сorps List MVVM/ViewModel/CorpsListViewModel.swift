//
//  CorpsListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 17.07.2024.
//

import Foundation

class CorpsListViewModel: ObservableObject {
    
    var corps = Buildings.pins
    @Published var isPresented = false
    @Published var currentId = 1
    
}
