//
//  NewsCellLetterCaseOptionsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 24.05.2025.
//

import SwiftUI

struct NewsCellLetterCaseOptionsListView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var viewModel = NewsCellLetterCaseOptionsListViewModel()
    
    var body: some View {
        List(viewModel.cases, id: \.self) { letterCase in
            if viewModel.isSavedLetterCase(letterCase: letterCase) {
                LetterCaseCell(letterCase: letterCase, isSelected: viewModel.isSavedLetterCase(letterCase: letterCase))
            } else {
                LetterCaseCell(letterCase: letterCase, isSelected: viewModel.isSavedLetterCase(letterCase: letterCase))
                    .onTapGesture {
                        viewModel.selectLetterCase(letterCase: letterCase)
                        closeScreen()
                    }
              }
        }
        .navigationTitle("Регистры букв")
        .onChange(of: viewModel.isChanged) {}
    }
    
    func closeScreen() {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

#Preview {
    NewsCellLetterCaseOptionsListView()
}
