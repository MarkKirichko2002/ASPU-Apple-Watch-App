//
//  TimetableOwnersListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 17.07.2024.
//

import SwiftUI

struct TimetableOwnersListView: View {
    
    var body: some View {
        NavigationView {
            List(TimetableOwners.owners) { owner in
                NavigationLink {
                    switch owner.id {
                    case 1:
                        FacultiesListView()
                    case 2:
                        DepartmentsListView()
                    case 3:
                        CorpsListView()
                    default:
                        WeeksListView()
                    }
                } label: {
                    TimetableOwnerCell(owner: owner)
                }
            }
            .navigationTitle("Расписание")
        }
    }
}

#Preview {
    TimetableOwnersListView()
}
