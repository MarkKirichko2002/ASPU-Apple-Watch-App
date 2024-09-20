//
//  PairTypeView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 16.08.2024.
//

import SwiftUI

struct PairTypeView: View {
    
    var date: String
    var type: PairType
    var disciplines = [Discipline]()
    @ObservedObject var viewModel = PairTypeViewModel()
    
    var body: some View {
        VStack {
            if viewModel.disciplines.isEmpty {
                Text("Нет пар")
                    .fontWeight(.bold)
            } else {
                List(viewModel.disciplines, id: \.self) { pair in
                    PairCell(discipline: pair)
                        .onTapGesture {
                            viewModel.currentDiscipline = pair
                            viewModel.isSelected.toggle()
                        }
                }
            }
        }
        .navigationTitle("\(type.title): \(viewModel.disciplinesCount())")
        .onAppear {
            viewModel.setUpData(disciplines: disciplines)
        }
        .onChange(of: viewModel.isSelected) {
            viewModel.isPresentedInfo.toggle()
        }
        .sheet(isPresented: $viewModel.isPresentedInfo) {
            PairInfoView(viewModel: PairInfoViewModel(pair: viewModel.currentDiscipline, date: date))
        }
    }
}

#Preview {
    PairTypeView(date: "", type: .all)
}
