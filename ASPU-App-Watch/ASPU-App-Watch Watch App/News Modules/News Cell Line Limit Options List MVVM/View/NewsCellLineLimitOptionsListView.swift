//
//  NewsCellLineLimitOptionsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 03.05.2025.
//

import SwiftUI

struct NewsCellLineLimitOptionsListView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var viewModel = NewsCellLineLimitOptionsListViewModel()
    
    var body: some View {
        List(viewModel.limits, id: \.self) { limit in
            if viewModel.isSavedLineLimit(limit: limit) {
                LineLimitCell(limit: limit, isSelected: viewModel.isSavedLineLimit(limit: limit))
            } else {
                LineLimitCell(limit: limit, isSelected: viewModel.isSavedLineLimit(limit: limit))
                    .onTapGesture {
                        viewModel.selectLineLimit(limit: limit)
                        closeScreen()
                    }
              }
        }
        .navigationTitle("Кол-во линий")
        .onChange(of: viewModel.isChanged) {}
    }
    
    func closeScreen() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

#Preview {
    NewsCellLineLimitOptionsListView()
}
