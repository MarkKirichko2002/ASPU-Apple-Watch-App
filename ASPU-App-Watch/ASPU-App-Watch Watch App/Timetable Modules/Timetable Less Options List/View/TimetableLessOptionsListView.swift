//
//  TimetableLessOptionsListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 26.10.2024.
//

import SwiftUI

struct TimetableLessOptionsListView: View {
    
    var date: String
    var disciplines: [Discipline]
    
    @Binding var isPresented: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List(TimetableOptions.lessOptions) { option in
                NavigationLink {
                    switch option.id {
                    case 1:
                        FacultiesListView()
                    case 2:
                        DepartmentsListView()
                    case 3:
                        CorpsListView()
                    case 4:
                        PairFilterTypeListView(date: date, disciplines: disciplines)
                    default:
                        EmptyView()
                    }
                } label: {
                    TimetableOptionCell(option: option)
                }
            }
            .navigationTitle("Расписание")
            .onDisappear {
                check()
            }
        }
    }
    
    func check() {
        if !presentationMode.wrappedValue.isPresented {
            isPresented.toggle()
        }
    }
}

//#Preview {
//    TimetableLessOptionsListView()
//}
