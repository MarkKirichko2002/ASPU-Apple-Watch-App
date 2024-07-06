//
//  NewsCategories.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 04.07.2024.
//

import Foundation

struct NewsCategories {
    
    static var categories = [
        NewsCategoryModel(id: 1, name: "АГПУ", abbreviation: "", isSelected: false),
        NewsCategoryModel(id: 2, name: "ФилФак", abbreviation: "filfak", isSelected: false),
        NewsCategoryModel(id: 3, name: "ФМФ", abbreviation: "fmf", isSelected: false),
        NewsCategoryModel(id: 4, name: "ППФ", abbreviation: "ppf", isSelected: false),
        NewsCategoryModel(id: 5, name: "ФТиФК", abbreviation: "ftifk", isSelected: false),
        NewsCategoryModel(id: 6, name: "ИСТФАК", abbreviation: "istfak", isSelected: false),
    ]
}
