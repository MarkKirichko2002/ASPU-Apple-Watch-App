//
//  InfoView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 12.09.2024.
//

import SwiftUI

struct InfoView: View {
    
    @ObservedObject var viewModel = InfoViewModel()
    var id: Int
    
    var body: some View {
        VStack(spacing: 20) {
            Image(viewModel.infoIcon(id: id))
                .resizable()
                .frame(width: 55, height: 55)
            Text(viewModel.info[0])
                .fontWeight(.bold)
        }.onAppear {
            viewModel.getTimetable()
        }
    }
}

#Preview {
    InfoView(id: 1)
}
