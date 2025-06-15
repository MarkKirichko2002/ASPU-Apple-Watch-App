//
//  AppSectionsListPositionOptionView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 31.10.2024.
//

import SwiftUI

struct AppSectionsListPositionOptionView: View {
    
    @ObservedObject var viewModel = AppSectionsListOptionViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.sections, id: \.id) { section in
                AppSectionCell(section: section)
                    .onTapGesture {
                        viewModel.changeVisibility(index: section.id)
                    }
            }.onMove { from, to in
                viewModel.sections.move(fromOffsets: from, toOffset: to)
            }
        }
        .navigationTitle("Разделы")
        .alert(isPresented: $viewModel.alert) {
            Alert(title: Text("Нельзя скрыть настройки"))
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    viewModel.saveSections(sections: viewModel.sections)
                }) {
                    Image("check")
                }.foregroundStyle(Color(UIColor.white))
            }
        }
        .onChange(of: viewModel.isChanged) {}
    }
}

#Preview {
    AppSectionsListPositionOptionView()
}
