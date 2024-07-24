//
//  FacultyGroupsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 23.07.2024.
//

import SwiftUI

struct FacultyGroupsListView: View {
    
    @State var currentGroup = ""
    @State var isPresented = false
    @State var isSelected = false
    
    var faculty: FacultyModel
    
    var body: some View {
        List(faculty.groups, id: \.self) { group in
            Text(group)
                .onTapGesture {
                    currentGroup = group
                    isSelected.toggle()
              }
        }
        .navigationTitle("Группы")
        .onChange(of: isSelected) {
            isPresented.toggle()
        }
        .sheet(isPresented: $isPresented, content: {
            TimetableDayResultListView(id: currentGroup, owner: "GROUP")
        })
    }
}

#Preview {
    FacultyGroupsListView(faculty: FacultyGroups.groups[0])
}
