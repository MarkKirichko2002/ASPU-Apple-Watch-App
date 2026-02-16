//
//  TimetableWeekOptionsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 26.10.2024.
//

import SwiftUI

struct TimetableWeekOptionsListView: View {
    
    var body: some View {
        NavigationView {
            List(TimetableOptions.weekOptions) { option in
                NavigationLink {
                    switch option.id {
                    case 1:
                        FacultiesListView()
                    case 2:
                        DepartmentsListView()
                    case 3:
                        CorpsListView()
                    default:
                        EmptyView()
                    }
                } label: {
                    TimetableOptionCell(option: option)
                }
            }
            .navigationTitle("Расписание")
        }
    }
}

//#Preview {
//    TimetableWeekOptionsListView()
//}
