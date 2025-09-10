//
//  NewsDateSectionInfoView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 08.08.2025.
//

import SwiftUI

struct NewsDateSectionInfoView: View {
    
    var section: NewsDateSectionModel
    
    @State var isPresented = false
    
    var body: some View {
        VStack(spacing: 25) {
            Image("mail")
                .resizable()
                .frame(width: 55, height: 55)
                .onTapGesture {
                    isPresented.toggle()
                 }
                Text("Всего новостей: \(section.news.count)")
                    .fontWeight(.bold)
                    .onTapGesture {
                        isPresented.toggle()
                     }
            }.navigationTitle(section.date)
            .sheet(isPresented: $isPresented) {
                NavigationView {
                    FillNewsListView(abbreviation: section.abbreviation, articles: section.news)
                }
            }
        }
    }

//#Preview {
//    NewsDateSectionInfoView()
//}
