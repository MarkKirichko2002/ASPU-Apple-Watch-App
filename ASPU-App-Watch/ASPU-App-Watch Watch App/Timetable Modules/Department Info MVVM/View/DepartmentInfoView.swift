//
//  DepartmentInfoView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 30.04.2025.
//

import SwiftUI

struct DepartmentInfoView: View {
    
    @ObservedObject var viewModel = DepartmentInfoViewModel()
    var id: Int
    
    var body: some View {
        VStack(spacing: 25) {
            Image("teacher")
                .resizable()
                .frame(width: 55, height: 55)
                .onTapGesture {
                    viewModel.isPresented.toggle()
                }
            Text(viewModel.text)
                .fontWeight(.bold)
                .onTapGesture {
                    viewModel.isPresented.toggle()
             }
        }.navigationTitle("Кафедра")
        .onAppear {
            viewModel.getDepartmentInfo(id: id)
        }
        .sheet(isPresented: $viewModel.isPresented) {
            TeachersListView(id: id)
        }
    }
}

#Preview {
    DepartmentInfoView(id: 1)
}
