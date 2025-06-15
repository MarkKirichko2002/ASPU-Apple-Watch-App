//
//  ViewConfigurator.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 05.09.2024.
//

import Foundation
import SwiftUI

struct CustomListStyle: ViewModifier {
    
    let style = SettingsManager().getSavedListStyle()
    
    func body(content: Content) -> some View {
        if style == .carousel {
            content
                .listStyle(.carousel)
        } else {
            content
                .listStyle(.automatic)
        }
    }
}
