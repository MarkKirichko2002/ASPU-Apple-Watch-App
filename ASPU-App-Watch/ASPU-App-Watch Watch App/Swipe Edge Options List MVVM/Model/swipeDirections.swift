//
//  swipeEdges.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 04.05.2025.
//

import Foundation
import SwiftUI

enum swipeEdges: String, CaseIterable, Codable {
    case left = "Левый"
    case right = "Правый"
    
    var edge: HorizontalEdge {
        switch self {
        case .left:
            return .leading
        case .right:
            return .trailing
        }
    }
}
