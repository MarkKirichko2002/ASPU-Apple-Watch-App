//
//  FacultyGroupsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 23.07.2024.
//

import SwiftUI

struct FacultyGroupsListView: View {
    
    @State var isPresented = false
    @State var currentGroup = ""
    var faculty: FacultyModel
    
    var body: some View {
        List(faculty.groups, id: \.self) { group in
            Text(group)
                .onTapGesture {
                    currentGroup = group
              }
        }
        .navigationTitle("Группы")
        .onChange(of: currentGroup) {
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
