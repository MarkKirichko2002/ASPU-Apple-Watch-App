//
//  NewsInfoOptionsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 13.11.2024.
//

import SwiftUI

struct NewsInfoOptionsListView: View {
    
    var abbreviation: String
    var id: Int
    @State var currentOption: NewsInfoOptions = .description
    @State var isPresented = false
    
    var body: some View {
        List(NewsInfoOptions.allCases, id: \.rawValue) { option in
            HStack {
                Text(option.rawValue)
                    .fontWeight(.bold)
                Spacer()
            }.contentShape(Rectangle())
            .onTapGesture {
                currentOption = option
                isPresented.toggle()
            }
        }
        .navigationTitle("Информация")
        .onChange(of: currentOption) {
            isPresented.toggle()
        }
        .sheet(isPresented: $isPresented) {
            NewsInfoView(abbreviation: abbreviation, id: id, option: currentOption)
         }
    }
}

//#Preview {
//    NewsInfoOptionsListView()
//}
