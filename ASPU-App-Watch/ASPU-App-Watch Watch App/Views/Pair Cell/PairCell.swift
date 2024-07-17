//
//  PairCell.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 05.07.2024.
//

import SwiftUI

struct PairCell: View {
    
    var discipline: Discipline
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            VStack(alignment: .center) {
                Text(discipline.time)
                    .foregroundStyle(Color.black)
                    .multilineTextAlignment(.center)
                Text(discipline.name)
                    .foregroundStyle(Color.black)
                    .multilineTextAlignment(.center)
                Text(discipline.teacherName)
                    .foregroundStyle(Color.black).multilineTextAlignment(.center)
                    .multilineTextAlignment(.center)
                Text("(\(discipline.groupName))")
                    .foregroundStyle(Color.black)
                    .multilineTextAlignment(.center)
                Text("(\(discipline.type.title))")
                    .foregroundStyle(Color.black)
                    .multilineTextAlignment(.center)
            }
            Spacer()
        }
        .listRowBackground(Color(discipline.type.color))
        .background(Color(discipline.type.color))
            .ignoresSafeArea()
    }
}

#Preview {
    PairCell(discipline: Discipline(id: UUID(), time: "8:00-9:30", name: "Электроника", groupName: "ВМ-ИВТ-2-1", teacherName: "Андрусенко", audienceID: "228", subgroup: 2, type: .lab))
}