//
//  NewsDateSectionCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 21.06.2025.
//

import SwiftUI

struct NewsDateSectionCell: View {
    
    var section: NewsDateSectionModel
    let settingsManager = SettingsManager()
    
    @State var isPresented = false
    
    var body: some View {
        NavigationLink {
            FillNewsListView(abbreviation: section.abbreviation, articles: section.news)
        } label: {
            if settingsManager.getSwipeOnOption() {
                HStack {
                    Text(section.date)
                        .fontWeight(.bold)
                }.swipeActions(edge: settingsManager.getSavedSwipeEdge().edge) {
                        Button {
                            isPresented.toggle()
                        } label: {
                            Image("info")
                        }
                    }
            } else {
                HStack {
                    Text(section.date)
                        .fontWeight(.bold)
                }
            }
        }.sheet(isPresented: $isPresented) {
            NewsDateSectionInfoView(section: section)
        }
    }
}

//#Preview {
//    NewsDateSectionCell()
//}
