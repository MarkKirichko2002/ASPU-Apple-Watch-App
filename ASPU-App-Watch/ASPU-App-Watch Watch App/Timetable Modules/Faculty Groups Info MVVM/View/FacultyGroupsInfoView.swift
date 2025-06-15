//
//  FacultyGroupsInfoView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 30.04.2025.
//

import SwiftUI

struct FacultyGroupsInfoView: View {
    
    @ObservedObject var viewModel = FacultyGroupsInfoViewModel()
    var faculty: FacultyModel
    
    var body: some View {
        VStack(spacing: 25) {
            Image("group")
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
        }.navigationTitle(faculty.facultyName.facultyAbbreviation())
        .onAppear {
            viewModel.getGroupsInfo(faculty: faculty)
        }
        .sheet(isPresented: $viewModel.isPresented) {
            FacultyGroupsListView(faculty: faculty)
        }
    }
}

//#Preview {
//    FacultyGroupsInfoView()
//}
