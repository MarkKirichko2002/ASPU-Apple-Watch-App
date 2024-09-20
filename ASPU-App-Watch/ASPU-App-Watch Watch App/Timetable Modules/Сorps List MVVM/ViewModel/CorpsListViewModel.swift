//
//  CorpsListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 17.07.2024.
//

import Foundation

final class CorpsListViewModel: ObservableObject {
    
    var corps = Buildings.pins
    @Published var isPresented = false
    @Published var currentBuilding = Buildings.pins[0]
    
}
