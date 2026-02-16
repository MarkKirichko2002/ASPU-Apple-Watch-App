//
//  CurrentDisciplinesListView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 15.06.2025.
//

import SwiftUI

struct CurrentDisciplinesListView: View {
    
    @State var isSelectedInfo = false
    @State var isPresentedInfo = false
    @State var currentDiscipline = Discipline(time: "", name: "", groupName: "", teacherName: "", audienceID: "", subgroup: 0, type: .all)
    var date = ""
    var pairs: [Discipline]
    
    var body: some View {
        List(pairs, id: \.self) { pair in
            HStack {
                if pair.subgroup == 0 {
                    Text("\(pair.name)")
                        .fontWeight(.bold)
                } else {
                    Text("\(pair.name) (подгруппа: \(pair.subgroup))")
                        .fontWeight(.bold)
                }
            }.onTapGesture {
                currentDiscipline = pair
                isSelectedInfo.toggle()
            }
            .contentShape(Rectangle())
        }.onChange(of: isSelectedInfo) {
            isPresentedInfo.toggle()
        }
        .sheet(isPresented: $isPresentedInfo) {
            PairInfoView(viewModel: PairInfoViewModel(pair: currentDiscipline, pairs: pairs, date: date))
        }
        .navigationTitle("Выберите пару")
    }
}

//#Preview {
//    CurrentDisciplinesListView()
//}
