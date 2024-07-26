//
//  FacultyModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 23.07.2024.
//

import Foundation

struct FacultyModel: Codable, Identifiable {
    let id = UUID()
    let facultyName: String
    let groups: [String]
}