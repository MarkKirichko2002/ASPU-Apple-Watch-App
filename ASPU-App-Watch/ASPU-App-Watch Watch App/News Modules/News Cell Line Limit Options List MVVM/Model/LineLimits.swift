//
//  LineLimits.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 03.05.2025.
//

import Foundation

enum LineLimits: String, Codable, CaseIterable, Hashable {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case unlimited = "Без лимитов"
    
    var numberOfLines: Int? {
        switch self {
        case .one:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        case .four:
            return 4
        case .five:
            return 5
        case .unlimited:
            return nil
        }
    }
}
