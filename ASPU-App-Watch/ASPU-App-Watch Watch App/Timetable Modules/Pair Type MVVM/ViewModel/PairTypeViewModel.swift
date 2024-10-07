//
//  PairTypeViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 16.08.2024.
//

import Foundation

final class PairTypeViewModel: ObservableObject {
    
    @Published var disciplines = [Discipline]()
    @Published var currentDiscipline = Discipline(id: "", time: "", name: "", groupName: "", teacherName: "", audienceID: "", subgroup: 0, type: .all)
    @Published var isPresentedInfo = false
    
    func setUpData(disciplines: [Discipline]) {
        self.disciplines = disciplines
    }
    
    func disciplinesCount()-> Int {
        return disciplines.count
    }
}
