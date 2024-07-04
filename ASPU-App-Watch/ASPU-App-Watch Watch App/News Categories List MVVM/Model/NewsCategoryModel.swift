//
//  NewsCategoryModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 04.07.2024.
//

import Foundation

struct NewsCategoryModel: Identifiable {
    let id: Int
    let name: String
    let abbreviation: String
    var isSelected: Bool
}
