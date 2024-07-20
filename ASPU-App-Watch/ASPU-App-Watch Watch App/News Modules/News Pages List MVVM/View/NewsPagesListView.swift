//
//  NewsPagesListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 20.07.2024.
//

import SwiftUI

struct NewsPagesListView: View {
    
    var count: Int
    
    var body: some View {
        
        List(1...count, id: \.self) { number in
            Text("Страница: \(number)")
        }
        .navigationTitle("Страницы")
    }
}

#Preview {
    NewsPagesListView(count: 46)
}
