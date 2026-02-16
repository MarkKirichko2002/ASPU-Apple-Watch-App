//
//  AppColors.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 18.10.2024.
//

import UIKit

enum AppColors: String, CaseIterable, Codable {
    
    case system
    case aspu
    case exam
    case prac
    
    var title: String {
        switch self {
        case .system:
            return "Системный"
        case .aspu:
            return "АГПУ"
        case .exam:
            return "Экзамен"
        case .prac:
            return "Практика"
        }
    }
    
    var color: UIColor {
        switch self {
        case .system:
            return UIColor.white
        case .aspu:
            return UIColor(named: "aspu") ?? .white
        case .exam:
            return UIColor(named: "exam") ?? .white
        case .prac:
            return UIColor(named: "prac") ?? .white
        }
    }
}
