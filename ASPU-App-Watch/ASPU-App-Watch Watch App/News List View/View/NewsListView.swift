//
//  NewsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 04.07.2024.
//

import SwiftUI

struct NewsListView: View {
    
    var body: some View {
        VStack {
            List {
                Text("Скоро!!!")
                Text("Скоро!!!")
                Text("Скоро!!!")
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        NewsCategoriesListView()
                    } label: {
                        Image("sections")
                    }
                }
            }
        }
    }
}

#Preview {
    NewsListView()
}
